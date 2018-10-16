class Front::UsersController < ApplicationController
  def new
  	@image = PostImage.new
  end

  def create
  	@image = PostImage.new(post_image_params)
  	@image.user_id = current_user.id
  	@image.save
  	redirect_to front_users_path
  end
  def index
    # @images = PostImage.all
    @images = current_user.post_images
  end

  def edit
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find(current_user.id)
    @user.update(user_params)
    redirect_to front_users_path(@user.id)
  end

  def destroy
    @image = PostImage.find(current_user.id)
    @image.destroy
    redirect_to front_users_path
  end

  private
  def post_image_params
  	params.require(:post_image).permit(:image)
  end
  def user_params
    params.require(:user).permit(:name, :age ,:profile_image)
  end
end
