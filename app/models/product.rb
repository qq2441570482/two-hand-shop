class Product < ActiveRecord::Base
	belongs_to :category
	mount_uploader :avatar, AvatarUploader

	has_many :user_products, dependent: :destroy
	has_many :users, through: :user_products
end
