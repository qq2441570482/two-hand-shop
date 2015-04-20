module ApplicationHelper

  # def current_user
  #   unless session[:user_id].nil?
  #     redirect_to login_path
  #   end
  # end

  def find_user(user_id)
    @user = User.find_by(id: user_id.to_i)
  end
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
end
