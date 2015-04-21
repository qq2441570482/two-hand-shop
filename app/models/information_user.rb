class InformationUser < ActiveRecord::Base
	belongs_to :user
	belongs_to :information

	validates :user_id, :information_id, presence: true
end
