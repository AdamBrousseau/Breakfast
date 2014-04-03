class SessionsController < ApplicationController

	 ############################################################
    #
    #   Controller: Sessions
    #   Associated Model: NA
    #   Purpose: This controller is responsible for all the
    #             actions associated with the User Sessions
    #   Actions: new, create, destroy
    #
    ############################################################

	skip_before_filter :session_expiry
	skip_before_filter :update_activity_time

	def new
	end

	# Action: create
    # Purpose: This action creates the instance of the session.
    # Functionality: Fetch the current User from the database.
    # 				 Authenticate the user and sign in, otherwise
    # 				 flash an error message and render the sign
    # 				 in page.
	def create
		user = User.find_by(email: params[:session][:email].downcase)
  		if user && user.authenticate(params[:session][:password])
  			if user.active?
				# Sign the user in and redirect to the user's show page.
				sign_in user
	      		redirect_back_or user
	      	else
	      		flash[:error] = 'Please activate your account'
	      		redirect_to activate_path
	      	end
		else
			# Create an error message and re-render the signin form.
			flash.now[:error] = 'Invalid email/password combination' # Not quite right!
      		render 'new'
		end
	end

	def check_session_alive
	  get_session_time_left
	  if @session_time_left > 0
	    render 'sessions/check_session_alive', :layout=>false
	  else
	    sign_out
	    deny_access 'Your session has timed out. Please log back in.'
	  end
	end

	# Action: destroy
	# Purpose: This action is responsible for destroying a user session
	# Functionality: Sign out the user and redirect to the Homepage.
	def destroy
		sign_out
    	redirect_to root_url
	end
end
