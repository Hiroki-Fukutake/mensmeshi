class AddPostImageIdToPostComments < ActiveRecord::Migration[5.2]
  def change
    add_column :post_comments, :post_image_id, :integer
  end
end
