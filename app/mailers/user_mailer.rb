class UserMailer < ActionMailer::Base
  default from: "rpjktest.email@gmail.com"
  
  def welcome_email(user)
    @user = user
    @url = 'http://rpjk-taskmanager.herokuapp.com/'
    mail(to: @user.email, subject: 'Welcome ' + @user.name + ', enjoy!')
  end
end
