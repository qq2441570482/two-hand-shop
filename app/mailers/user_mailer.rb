class UserMailer < ActionMailer::Base

  def welcome
    mail(:to => 'yqwang@thoughtworks.com')
  end

  def verifyemail(user)
  	mail(:to => user.email)
  end
end
