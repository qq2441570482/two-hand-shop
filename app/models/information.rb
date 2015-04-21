class Information < ActiveRecord::Base
  has_many :information_users, dependent: :destroy
  has_many :users, through: :information_users

  belongs_to :category
  validates :title, :price, :description, presence: true
  validates :price, numericality: {greater_than: 0}, unless: 'price.nil?'
end
