module UsersHelper
  def sign_in(user)
    session[:user_id] = user.id
  end

  def convert_to_chinese(role)
  	if role == 'admin'
  	  '管理员'
  	elsif role == 'buyer' 
  	  '买家'
  	else
  	  '卖家'
    end
  end
end
