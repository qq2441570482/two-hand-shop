class UsersController < ApplicationController
  before_action :require_login, only: [:changepassword,:setprofile, :verifyemail, :uploadpicture]
  before_action :find_a_user, only: [:confirmchangepassword, 
                                     :confirmchangeprofile,
                                     :setprofile, 
                                     :verifyemail,
                                     :sendverifyemail,
                                     :uploadpicture,
                                     :confirmuploadpicture,
                                     :destroy]

  before_action :new_a_user, only: [:new, :create, :register_center]                                   

  include UsersHelper
  
  def login
  end

  def register
  end

  def setprofile
  end

  def auth
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      sign_in(user)
      redirect_to root_path
    else
      render :login
    end
  end

  def register_center
    @user.email = params[:email]
    @user.password = params[:password]
    @user.password_confirmation = params[:password_confirmation]
    if @user.save
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

  def changepassword
  end

  def confirmchangepassword
    if @user.authenticate(params[:user][:oldpassword]) &&  params[:user][:password] == params[:user][:password_confirmation]
      @user.update(password: params[:user][:password])
      redirect_to users_setprofile_path
    else
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
    @user.phone = params[:user][:phone]
    @user.address = params[:user][:address]
    @user.gender = string_transfer_bool(params[:user][:gender])
    if @user.save
      redirect_to users_setprofile_path
    else
      render :setprofile
    end
  end


  def sendverifyemail
    #发送邮件的逻辑操作, 还需要进行测试
    UserMailer.verifyemail(@user)
  end

  def confirmuploadpicture
    @user.avatar = params[:user][:avatar]
    if @user.save
      redirect_to users_uploadpicture_path
    else
      render :uploadpicture
    end
  end
  
  def index
    @users = User.all
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
    if @user.save
      redirect_to users_path
    else
      render :new
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path
  end

  private
  def string_transfer_bool(gender)
    if gender == 'true'
      return true
    else
      return false
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
