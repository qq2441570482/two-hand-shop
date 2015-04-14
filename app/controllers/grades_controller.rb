class GradesController < ApplicationController
  before_action :require_login
  before_action :find_a_grade, only: [:destroy, :edit, :update]
  before_action :new_a_grade, only: [:new, :create]
  before_action :create_and_update, only: [:create, :update]

  def index
  	@grades = Grade.all
  end

  def create 	
  end

  def destroy
  	#这里同时将外键引用置为null
  	@grade.destroy
  	redirect_to grades_path
  end

  def update
  end

  private 
  def find_a_grade
  	@grade = Grade.find(params[:id]) 
  end

  def new_a_grade
    @grade = Grade.new
  end

  def create_and_update
    @grade.name = params[:grade][:name]
    binding.pry
    if @grade.save
      redirect_to grades_path 
    else
      if params[:action] == 'create'
        render :new
      else
        render :edit
      end
    end
  end
end
