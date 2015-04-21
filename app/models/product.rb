class Product < ActiveRecord::Base
	belongs_to :category
	mount_uploader :avatar, AvatarUploader

	has_many :user_products, dependent: :destroy
	has_many :users, through: :user_products

	validates :title, :price, :description, :avatar, presence: true
	validates :price, numericality: {greater_than: 0}, unless: 'price.nil?'

end
