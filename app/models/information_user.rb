class InformationUser < ActiveRecord::Base
	belongs_to :user
	belongs_to :information
end
