class PasswordResetsController < ApplicationController
  
  skip_before_filter :session_expiry
  skip_before_filter :update_activity_time
  
  #def new
  #end

  def create
  	if verify_recaptcha(:password_reset => @password_reset, :message => "Please enter the correct captcha!")
	  	user = User.find_by(email: params[:password_reset][:email].downcase)
	  	user.send_password_reset if user
	  	redirect_to root_url, :notice => 'An email has been sent with instructions to reset your password'
	else
		render 'new'
	end
  end

  def edit
  	@user = User.find_by_password_reset_token!(params[:id])
  end

  def update
  	@user = User.find_by_password_reset_token!(params[:id])
  	if @user.password_reset_sent_at < 2.hours.ago
  		redirect_to new_password_reset_path, :alert => 'Password reset token has expired'
  	elsif @user.update_attributes(user_params)
  		redirect_to signin_url, :notice => 'Password has been reset'
  	else
  		render 'edit'
  	end
  end

  private

  	def user_params
      params.require(:user).permit( :password,
                                    :password_confirmation)
    end
end
