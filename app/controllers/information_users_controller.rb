class InformationUsersController < ApplicationController
  before_action :require_login
  before_action :find_a_information_user, only: [:edit,:update,:destroy,:show]

  def index
    @information_users = InformationUser.where(user_id: session[:user_id])
  end

  def edit
  	@categories = Category.all
  end

  def update
  	information = @information_user.information
  	information.title = params[:information_user][:information][:title]
  	information.category_id = params[:category].to_i
  	information.price = params[:information_user][:information][:price].to_f
  	information.description = params[:information_user][:information][:description]
  	if information.save
  	  redirect_to information_users_path
  	else
      render :edit
  	end
  end

  def destroy
  	#实现了级联删除, 删除了information表，就同时也是删除了第三张关联表
  	@information_user.information.destroy
  end

  private 
  def find_a_information_user
    @information_user = InformationUser.find(params[:id])
  end

end
