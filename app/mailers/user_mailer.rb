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

  def password_reset(user)
  	@user = user
  	mail(to: @user.email, subject: "WebPHR Password Reset")
  end
end
