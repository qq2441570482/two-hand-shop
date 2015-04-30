class MajorsController < ApplicationController
  before_action :require_login
  before_action :find_a_major, only: [:edit,:update, :destroy]
  before_action :new_a_major, only: [:new, :create]
  before_action :create_and_update, only: [:create, :update]
  before_action :judge_user_status, only: [:index, :destroy, :new, :edit, :create, :update]

  def index
  	@majors = Major.all
  end

  def create
  end

  def update
  end

  def destroy
    @major.destroy
    redirect_to majors_path 
  end

  private

  def find_a_major
    @major = Major.find(params[:id])
  end

  def create_and_update
    @major.name = params[:major][:name]
    if @major.save
      redirect_to majors_path 
    else
      if params[:action] == 'create'
        render :new
      else
        render :edit
      end
    end
  end

  def new_a_major
    @major = Major.new
  end
end
