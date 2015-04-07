class UsersController < ApplicationController
  include UsersHelper
  def login
  end

  def register
  end

  def setprofile
  end

  def auth
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      sign_in(user)
      redirect_to root_path
    else
      render :login
    end
  end

  def register_center
    user = User.new
    user.username = params[:username]
    user.password = params[:password]
    user.password_confirmation = params[:password_confirmation]
    if user.save
      sign_in(user)
      redirect_to root_path
    else
      render :register
    end
  end

  def logout
    session.delete :user_id
    redirect_to root_path
  end
end
