require 'rails_helper'

RSpec.describe GradesController, type: :controller do
  include UsersHelper
  before do
	user = FactoryGirl.create :user
	user.add_role :admin
	sign_in(user)
  end

  describe 'get index page' do
    it 'should list all grades' do
	  grade = FactoryGirl.create :grade
	  get :index
	  expect(assigns[:grades].size).to be > 0
	end
  end

  describe 'get new page' do
    it 'shoudl init a new grade' do
      get :new
      expect(assigns[:grade]).to be_a_new(Grade)
    end  
  end

  describe 'post create a grade' do
  	it 'should save a grade and redirect to index page' do
      post :create, :grade => {:name => 'dasan'}
      expect(response).to redirect_to(grades_path)
    end
  end
  

   describe 'delete a grade' do
    it 'should delete a grade and redirect to index page' do
      grade = FactoryGirl.create :grade
      delete :destroy, :id => grade.id
      expect(response).to redirect_to(grades_path)
    end
  end

end
