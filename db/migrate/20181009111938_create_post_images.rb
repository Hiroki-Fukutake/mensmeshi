class CreatePostImages < ActiveRecord::Migration[5.2]
  def change
    create_table :post_images do |t|
    	t.integer :post_image_id, null: false
    	t.integer :user_id
      t.timestamps
    end
  end
end
