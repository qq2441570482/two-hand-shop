class UsersController < ApplicationController
  before_action :require_login, only: [:changepassword,:setprofile, :verifyemail, :uploadpicture]
  before_action :find_a_user, only: [:confirmchangepassword, 
                                     :confirmchangeprofile,
                                     :setprofile, 
                                     :verifyemail,
                                     :sendverifyemail,
                                     :uploadpicture,
                                     :confirmuploadpicture,
                                     :destroy,
                                     :setstatus,
                                     :applyseller]

  before_action :new_a_user, only: [:new, :create, :register_center]
  before_action :judge_user_status, only: [:index, :new, :setstatus, :destroy]

  include UsersHelper
  
  def login
    @user = User.new
  end

  def register
    @user = User.new
  end

  def auth
    @user = User.find_by(email: params[:user][:email])
    if @user && @user.authenticate(params[:user][:password])&& @user.status == true
      sign_in(@user)
      redirect_to root_path
    else
      flash[:errors] = '用户名或密码错误'
      redirect_to :login
    end
  end

  def register_center
    @user.email = params[:user][:email]
    @user.password = params[:user][:password]
    @user.password_confirmation = params[:user][:password_confirmation]
    @user.status = true
    @user.info_status = false
    if @user.save
      give_a_person_a_status(@user)
      sign_in(@user)
      redirect_to root_path
    else
      render :register
    end
  end

  def logout
    session.delete :user_id
    redirect_to root_path
  end

  def confirmchangepassword
    if @user.authenticate(params[:user][:oldpassword]) &&  params[:user][:password] == params[:user][:password_confirmation]
      @user.update(password: params[:user][:password])
      redirect_to users_setprofile_path
    else
      flash[:password_errors] = '修改密码发生错误'
      render :changepassword
    end
  end

  def setprofile
    @grades = Grade.all
    @majors = Major.all
  end

  def confirmchangeprofile
    @user.username = params[:user][:username]
    @user.grade_id = params[:grade].to_i
    @user.major_id = params[:major].to_i
    @user.phone = params[:user][:phone]  unless params[:user][:phone].blank?
    @user.address = params[:user][:address]
    @user.gender = string_transfer_bool(params[:user][:gender])
    if @user.username? && @user.grade_id? && @user.major_id? && @user.phone? && @user.address? && @user.gender != nil
       @user.info_status = true
    end    
    if @user.save
      redirect_to users_setprofile_path
    else
      @grades = Grade.all
      @majors = Major.all
      render :setprofile
    end
  end


  def sendverifyemail
    #发送邮件的逻辑操作, 还需要进行测试
    @@number = rand(9999)
    UserMailer.verifyemail(@user,@@number).deliver
    redirect_to users_verifyemail_path
  end

  def confirmverifyemail
    if @@number = params[:token]
      user = User.find(params[:id])
      user.email_status = true
      user.save
      redirect_to users_verifyemail_path
    end
  end

  def confirmuploadpicture
    if params[:user]
      @user.avatar = params[:user][:avatar]
      if @user.save
        redirect_to users_uploadpicture_path
      else
        render :uploadpicture
      end
    else
      flash[:errors] = '照片不能为空'
      render :uploadpicture
    end
  end
  
  def index
    @users = User.all.page(params[:page]).per(10)
  end

  def new
    @majors = Major.all
    @grades = Grade.all
  end

  def create
    #初始密码设为123456
    @user.username = params[:user][:username]
    @user.email = params[:user][:email]
    @user.grade_id = params[:grade].to_i
    @user.major_id = params[:major].to_i
    @user.password = "123456"
    @user.password_confirmation = "123456"
    @user.status = true
    @user.add_role :admin
    if @user.save
      redirect_to users_path
    else
      render :new
    end
  end

  def destroy
    #把相应的product删除掉
    @user.products.each do |product|
      Product.destroy(product.id)
    end
    @user.destroy
    redirect_to users_path
  end

  def setstatus
    unless @user.status
      @user.status = true
      @user.products.each do |product|
        product.status = true
        product.save
      end
      @user.information_users.each do |information_user|
        information_user.status = true
        information_user.save
      end
    else
      @user.status = false
      @user.products.each do |product|
        product.status = false
        product.save
      end
      @user.information_users.each do |information_user|
        information_user.status = false
        information_user.save
      end
    end
    @user.save
    redirect_to users_path
  end

  private
  def string_transfer_bool(gender)
    if gender == 'true'
      true
    else
      false
    end
  end

  def find_a_user
    if params[:id].present?
      @user = User.find(params[:id])
    else
      @user = User.find(session[:user_id])
    end
  end

  def new_a_user
    @user = User.new
  end

end
