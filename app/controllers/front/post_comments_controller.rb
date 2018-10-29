class Front::PostCommentsController < ApplicationController

	def create
		post_image = PostImage.find(params[:post_image_id])
		comment = PostComment.new(post_comment_params)
		comment.user_id = current_user.id
		comment.post_image_id = post_image.id
		if comment.save
			redirect_to front_post_image_path(post_image)
		else
			redirect_to front_post_image_path(post_image)
			flash[:error] = "コメントが未入力です。"
		end
	end
	def destroy
		post_image = PostImage.find(params[:post_image_id])
		comment = post_image.post_comments.find(params[:id])
		comment.destroy
		redirect_to front_post_image_path(post_image)
	end

	private
	def post_comment_params
		params.require(:post_comment).permit(:id,:comment)
	end
end
