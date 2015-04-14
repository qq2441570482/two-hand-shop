class Information < ActiveRecord::Base
  has_many :information_users, dependent: :destroy
  has_many :users, through: :information_users

  belongs_to :category
end
