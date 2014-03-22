class ActivationsController < ApplicationController
	
	def new
	end

	def create
		@user = User.find_by(email: params[:activation][:email].downcase)
		if @user && @user.activation_token == params[:activation][:activation_code].to_s
			if @user.update_attribute(:active, true)
				flash[:success] = "Your account has been activated."
				redirect_to signin_url, notice: "Please sign in."
			else
				flash.now[:error] = 'Error activating your account. Please contact us.'
			end
		else
			flash.now[:error] = 'Invalid email/activation code combination' # Not quite right!
      		render 'new'
		end
	end

	def edit
	end

	def resend
		@user = User.find_by(email: params[:activation][:email].downcase)
		if @user && @user.authenticate(params[:activation][:password])
			UserMailer.reactivation_email(@user).deliver
			render 'new'
		else
			flash.now[:error] = 'Invalid email/password combination' # Not quite right!
      		render 'edit'
		end
	end
end
