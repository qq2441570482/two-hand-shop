class Grade < ActiveRecord::Base
	has_many :users, dependent: :nullify
end
