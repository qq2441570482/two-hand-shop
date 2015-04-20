class User < ActiveRecord::Base
  rolify
  validates :password_confirmation , presence: true, if: 'password_digest.nil?'
  validates :password, confirmation: true
  validates :email, presence: true
  validates :email, format: {with: /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/}
  validates :email, uniqueness: {case_sensitive: false}

  has_secure_password

  belongs_to :major
  belongs_to :grade
  validates :grade , presence: true, unless: :check_grade_nil?

  def check_grade_nil?
    grade_id.nil?
    # true
  end

  mount_uploader :avatar, AvatarUploader

  has_many :user_products
  has_many :products, through: :user_products

  has_many :information_users
  has_many :information, through: :information_users

  # has_many :favorites
  # has_many :products, through: :favorites
end
