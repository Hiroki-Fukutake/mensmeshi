class PostComment < ApplicationRecord
	belongs_to :post_image
	belongs_to :user

	validates :comment, presence: true
end
