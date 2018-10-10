class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :post_image

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
