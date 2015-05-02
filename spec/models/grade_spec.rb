require 'rails_helper'

RSpec.describe Grade, type: :model do
	it 'should require a name' do
		FactoryGirl.build(:grade, :name => "").should_not be_valid
	end

	it 'should require a different name' do
		grade = FactoryGirl.create :grade, :name => "dayi"
		FactoryGirl.build(:grade, :name => "dayi").should_not be_valid
	end

    it 'should create a grade' do
    	FactoryGirl.build(:grade, :name => "daer").should be_valid
    end
end
