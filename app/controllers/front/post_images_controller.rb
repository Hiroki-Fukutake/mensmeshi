class Front::PostImagesController < ApplicationController

  def index
  	@images = PostImage.all
  end
  def show
    @image = PostImage.find(params[:id])
    @comment = PostComment.new
  end

  protected
  def post_comment_params
    params.require(:post_comment).permit(:comment, :user_id, :image_id)
  end
end
