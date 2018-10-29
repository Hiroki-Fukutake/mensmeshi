class Front::PostImagesController < ApplicationController

  def index
  	@eating_home = PostImage.where(category: 1).order(created_at: :desc)
    @eating_out = PostImage.where(category: 2).order(created_at: :desc)
    @image_ranking = PostImage.find(Favorite.group(:post_image_id).order("count_all desc").count.keys).first(5)
  end
  def show
    @image = PostImage.find(params[:id])
    @comment = PostComment.new
  end
  def edit
    @image = PostImage.find(params[:id])
    @images_count = PostImage.where(user_id: current_user.id, category: 1)
    @eating_out_count = PostImage.where(user_id: current_user.id, category: 2)
  end
  def update
    user_image = PostImage.find(params[:id])
    user_image.update(post_update_params)
    redirect_to front_users_path
  end

  private
  def post_comment_params
    params.require(:post_comment).permit(:comment, :user_id, :image_id)
  end
  def post_update_params
    params.require(:post_image).permit(:id,:user_id,:title, :category_id, :genre_id)
  end
end
