class CategoriesController < ApplicationController
  before_action :require_login
  before_action :find_a_category, only: [:destroy, :edit, :update]
  before_action :new_a_category, only: [:new, :create]
  before_action :create_and_update, only: [:create, :update]
  before_action :judge_user_status, only: :index

  def index
  	@categorys = Category.all
  end

  def destroy
  	@category.destroy
  	redirect_to categories_path
  end

  def create
  end

  def update
  end

  private 
  def find_a_category
  	@category = Category.find(params[:id])
  end

  def new_a_category
    @category = Category.new
  end

  def create_and_update
    @category.name = params[:category][:name]
    if @category.save
      redirect_to categories_path
    else
      if params[:action] == 'create'
        render :new
      else
        render :edit
      end
    end
  end
  
end
