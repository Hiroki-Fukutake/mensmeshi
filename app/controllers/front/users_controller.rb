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

  def edit
  end

  def update
  end

  private
  def post_image_params
  	params.require(:post_image).permit(:image)
  end
end
