module SessionsHelper

	def sign_in(user)
	    remember_token = user.remember_token
	    update_activity_time
	    cookies[:remember_token] = remember_token
	    user.update_attribute(:remember_token, User.encrypt(remember_token))
	    self.current_user = user
	end

	def signed_in?
	    !current_user.nil?
	end

	def signed_in_user
		unless signed_in?
			store_location
			redirect_to signin_url, notice: "Please sign in."
		end
	end

	def current_user=(user)
    	@current_user = user
  	end

  	def current_user
	    remember_token = User.encrypt(cookies[:remember_token])
	    @current_user ||= User.find_by(remember_token: remember_token)
	end

	def current_user?(user)
		user == current_user
	end

	def sign_out
	    current_user.update_attribute(:remember_token,
	                                  User.encrypt(current_user.remember_token))
	    cookies.delete(:remember_token)
	    self.current_user = nil
	end

	def redirect_back_or(default)
		redirect_to(session[:return_to] || default)
		session.delete(:return_to)
	end

	def store_location
    	session[:return_to] = request.url if request.get?
  	end

  	def deny_access(msg = nil)
	  msg ||= "Please sign in to access this page."
	  flash[:notice] ||= msg
	  respond_to do |format|
	    format.html {
	      store_location
	      redirect_to signin_url
	    }
	    format.js {
	      store_location request.referer
	      render 'sessions/redirect_to_signin', :layout=>false
	    }
	  end
	end
end
