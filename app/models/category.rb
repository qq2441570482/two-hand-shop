class Category < ActiveRecord::Base
	has_many :products, dependent: :nullify
	has_many :information

	validates :name, presence: true
	validates :name, uniqueness: {case_sensitive: false} 
end
