class Product < ActiveRecord::Base
	belongs_to :category
	mount_uploader :avatar, AvatarUploader

	has_many :user_products, dependent: :destroy
	has_many :users, through: :user_products


	# has_many :favorites, dependent: :destroy
	# has_many :users, through: :favorites

end
