class WelcomeController < ApplicationController
  def index
    @categories = Category.all
    @products = Product.all
    if params[:condition].present?
    	@products = @products.where(category_id: params[:condition].to_i)
    end
  end

  def show
  	@product = Product.find_by_id(params[:id])
  end

  def ask
    @information_users = InformationUser.all
  end

end
