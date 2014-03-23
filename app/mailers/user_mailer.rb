class UserMailer < ActionMailer::Base
  default from: "webphr@gmail.com"

  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to WebPHR')
  end

  def reactivation_email(user)
    @user = user
    mail(to: @user.email, subject: 'WebPHR Activation Code')
  end
end
