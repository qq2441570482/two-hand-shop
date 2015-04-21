class InformationController < ApplicationController

  before_action :require_login

  def new
    @categories = Category.all
	  @information = Information.new		
  end

  def create
  	#先插入信息表
    #再在用户信息联合表中插入数据
    @information = Information.new
    @information.title = params[:information][:title]
    @information.price = params[:information][:price].to_f
    @information.description = params[:information][:description]
    @information.category_id = params[:category].to_i
    if @information.valid?
      @information.save
      information_user = InformationUser.new
      information_user.information_id = @information.id
      information_user.user_id = session[:user_id].to_i
      information_user.status = true
      information_user.save
      redirect_to root_path
    else
      @categories = Category.all
      render :new
    end  
  end
end
