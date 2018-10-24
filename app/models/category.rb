class Category < ApplicationRecord
	has_many :post_images
	belongs_to :user
end
