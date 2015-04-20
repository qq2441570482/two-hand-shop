class UserProductsController < ApplicationController
  before_action :require_login
  before_action :find_a_user_product, only: [:edit,:update, :destroy]

  def index
  	@user_products = UserProduct.where(user_id: session[:user_id]).page(params[:page]).per(8)
  end

  def edit
  	@categories = Category.all
  end

  def update
  	product = @user_product.product
  	product.title = params[:user_product][:product][:title]
  	product.category_id = params[:category]
  	product.price = params[:user_product][:product][:price]
  	product.description = params[:user_product][:product][:description]
  	if product.save
  	  redirect_to user_products_path
  	else
  	  render :edit
  	end
  end

  def destroy
    @user_product.product.destroy
  	redirect_to user_products_path
  end

  private
  def find_a_user_product
    @user_product = UserProduct.find(params[:id])
  end
end
