class ProductsController < ApplicationController
  before_action :require_login
  before_action :find_a_product, only: [:setstatus, :destroy]
  before_action :require_complete_info, only: :new
  before_action :judge_user_status, only: [:index, :destroy, :setstatus]

  def index
    @products = Product.all.page(params[:page]).per(4)
  end

  def new
  	@product = Product.new
  	@categories = Category.all
  end

  def create
  	#首先插入到商品表中
  	#其次插入到一张联合表中
    @product = Product.new
    @categories = Category.all
    @product.title = params[:product][:title]
    @product.category_id = params[:category].to_i
    @product.price = params[:product][:price].to_f
    @product.avatar = params[:product][:avatar]
    @product.description = params[:product][:description]
    @product.status = true
    if @product.save
      @product.save
      userProduct = UserProduct.new
      userProduct.user_id = session[:user_id].to_i
      userProduct.product_id = @product.id  
      userProduct.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    @product.destroy
    redirect_to products_path
  end

  def setstatus
    unless @product.status
      @product.status = true
    else
      @product.status = false
    end
    @product.save
    redirect_to products_path
  end

  def require_complete_info
    user = User.find(session[:user_id])
    unless user.info_status
      redirect_to users_setprofile_path
    end 
  end

  private 
  def find_a_product
    @product = Product.find(params[:id])
  end

end
