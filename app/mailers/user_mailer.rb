class UserMailer < ActionMailer::Base
  default from: '2441570482@qq.com'	

  def welcome
    mail(:to => 'qq2441570482@gmail.com')
  end

  def verifyemail(user,number)
  	@user = user
  	@number = number
  	@url = 'http://maimaimai.herokuapp.com/users/confirmverifyemail/'+ @user.id.to_s + '/' +@number.to_s
  	mail(:to => @user.email, subject: '邮箱验证')
  end
end
