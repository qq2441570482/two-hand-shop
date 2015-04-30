class WelcomeController < ApplicationController
  def index
    @categories = Category.all
    @products = Product.where(status: true).page(params[:page]).per(8)
    if params[:condition].present?
    	@products = @products.where(category_id: params[:condition].to_i)
    end
    if params[:search].present?
      @products = @products.where('title like ?', '%' + params[:search] + '%')
    end
  end

  def show
  	@product = Product.find_by_id(params[:id])
  end

  def ask
    @information_users = InformationUser.where(status: true).page(params[:page]).per(4)
  end

end
