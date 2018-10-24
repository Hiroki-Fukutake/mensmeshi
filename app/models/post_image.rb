class PostImage < ApplicationRecord
	belongs_to :user
	belongs_to :category, optional: true
	belongs_to :genre, optional: true
	has_many :post_comments, dependent: :destroy
	has_many :favorites, dependent: :destroy
	attachment :image

	def favorited_by?(user)
		favorites.where(user_id: user.id).exists?
	end
end
