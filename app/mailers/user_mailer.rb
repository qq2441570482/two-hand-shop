class UserMailer < ActionMailer::Base

  def welcome
    mail(:to => 'yqwang@thoughtworks.com')
  end

  def verifyemail(user,number)
  	@user = user
  	@number = number
  	@url = 'http://localhost:3000/users/confirmverifyemail/'+ @user.id.to_s + '/' +@number.to_s
  	mail(:to => user.email, subject: '邮箱验证')
  end
end
