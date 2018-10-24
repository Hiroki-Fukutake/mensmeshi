class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true
  validates :age, presence: true
  has_many :post_images, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :category, dependent: :destroy
  has_many :genre, dependent: :destroy
  attachment :profile_image

    def soft_delete
    	update(deleted_at: Time.now)
    end
    def active_for_authentication?
    	!deleted_at
    end
    def inactive_message
    	!deleted_at ? super : :deleted_account
    end
end
