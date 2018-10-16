class Front::PostImagesController < ApplicationController
  def new
  end
  def index
  	@image = PostImage.all
  end
  def show
  end


  protected
  def post_image_params
  	params.require(:post_image).permit(:image ,:created_at)
  end
end
