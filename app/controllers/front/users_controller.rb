class Front::UsersController < ApplicationController

  def create
  	@image = PostImage.new(post_image_params)
  	@image.user_id = current_user.id
    @image.save
  	redirect_to front_users_path
  end
  def index
    @image = PostImage.new
    @images = PostImage.where(user_id: current_user.id, category: 1).order(created_at: :desc)
    @eating_out = PostImage.where(user_id: current_user.id, category: 2).order(created_at: :desc)
    @images_count = PostImage.where(user_id: current_user.id, category: 1)
    @eating_out_count = PostImage.where(user_id: current_user.id, category: 2)


    @post_images = current_user.post_images
    @count = 0
    @post_images.each do |p|
      @favorite = Favorite.where(post_image_id: p.id)
      @count += @favorite.count
    end
  end

  def edit
    @user = User.find(current_user.id)
    @images_count = PostImage.where(user_id: current_user.id, category: 1)
    @eating_out_count = PostImage.where(user_id: current_user.id, category: 2)
  end

  def update
    @user = User.find(current_user.id)
    @user.update(user_params)
    redirect_to front_users_path(@user.id)
  end

  def destroy
    @image = PostImage.find(params[:id])
    @image.destroy
    redirect_to front_users_path
  end

  private
  def post_image_params
  	params.require(:post_image).permit(:image,:title, :category_id, :genre_id)
  end
  def user_params
    params.require(:user).permit(:name, :age ,:profile_image)
  end
end
