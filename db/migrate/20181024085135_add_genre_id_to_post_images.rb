class AddGenreIdToPostImages < ActiveRecord::Migration[5.2]
  def change
    add_column :post_images, :genre_id, :integer
  end
end
