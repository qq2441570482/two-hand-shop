class ProductsController < ApplicationController
  before_action :require_login

  def new
  	@product = Product.new
  	@categories = Category.all
  end

  def create
  	#首先插入到商品表中
  	#其次插入到一张联合表中
  	product = Product.new
  	product.title = params[:product][:title]
  	product.category_id = params[:category].to_i
  	product.price = params[:product][:price].to_f
  	product.avatar = params[:product][:avatar]
  	product.description = params[:product][:description]
  	

  	userProduct = UserProduct.new
  	userProduct.user_id = session[:user_id].to_i
  	userProduct.product_id = product.id
  	

  	if product.save && userProduct.save
  		redirect_to root_path
  	else
  		render :new
  	end
  end


end
