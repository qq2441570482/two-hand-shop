class UserMailer < ActionMailer::Base

  def welcome
    mail(:to => 'yqwang@thoughtworks.com')
  end
end
