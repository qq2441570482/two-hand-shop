class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def require_login
  	unless session[:user_id]
  	  redirect_to login_path
  	end
  end

  def give_a_person_a_status(user)
  	if user.is_a?(User)
  	  if user.email == '2441570482@qq.com'
  	    user.add_role :admin
  	  else
  	  	user.add_role :buyer
  	  end
  	end
  end

   def judge_user_status
    if session[:user_id]
      user = User.find(session[:user_id])
      unless user.roles[0].name == 'admin'
        session.delete :user_id
        redirect_to login_path
      end
    else
      redirect_to login_path
    end
  end
 
end
