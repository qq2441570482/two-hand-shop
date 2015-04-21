class Grade < ActiveRecord::Base
	has_many :users, dependent: :nullify
	validates :name, presence: true
	validates :name, uniqueness: {case_sensitive: false}
end
