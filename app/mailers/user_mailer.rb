class UserMailer < ActionMailer::Base
  default from: "webphr@gmail.com"

  def welcome_email(user)
    @user = user
    @url  = 'https://cryptic-journey-7827.herokuapp.com/signin'
    mail(to: @user.email, subject: 'Welcome to WebPHR')
  end
end
