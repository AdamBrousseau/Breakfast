class UserMailer < ActionMailer::Base
  #default from: "broussar@mcmaster.ca"
  default from: "webphr@gmail.com"

  def welcome_email(user)
    @user = user
    @login_url  = 'localhost:3000/signin'
    @activate_url = 'localhost:3000/activate'
    mail(to: @user.email, subject: 'Welcome to WebPHR')
  end

  def reactivation_email(user)
    @user = user
    @login_url  = 'localhost:3000/signin'
    @activate_url = 'localhost:3000/activate'
    mail(to: @user.email, subject: 'WebPHR Activation Code')
  end
end
