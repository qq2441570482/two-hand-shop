class UsersController < ApplicationController
  include UsersHelper
  def login
  end

  def register
  end

  def auth
    binding.pry
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      sign_in(user)
      redirect_to root_path
    else
      render :login
    end
  end

  def register_center
    binding.pry
  end
end
