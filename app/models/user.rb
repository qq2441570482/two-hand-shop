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
  validates :grade , presence: true, unless: 'grade_id.nil?'

  mount_uploader :avatar, AvatarUploader

  has_many :user_products, dependent: :destroy
  has_many :products, through: :user_products

  has_many :information_users, dependent: :destroy
  has_many :information, through: :information_users

  validates :phone, format: {with: /^0{0,1}(13[0-9]|15[0-9])[0-9]{8}$/, :multiline => true}, unless: 'phone.nil?'

end
