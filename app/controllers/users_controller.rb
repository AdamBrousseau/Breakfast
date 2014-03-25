class UsersController < ApplicationController
  #########################################################
  #
  #   Controller: Users
  #   Associated Model: User
  #   Purpose: This controller is responsible for all the
  #             actions associated with the User model
  #   Actions: new, create, show, edit, update, destroy
  #
  #########################################################

  # Before performing actions show, edit and update, ensure the user is
  # signed_in and the correct_user is requesting the action. Also ensure
  # that only admin users can delete User records.
  before_action :signed_in_user, only: [:show, :edit, :update]
  before_action :correct_user,   only: [:show, :edit, :update]
  skip_before_filter :session_expiry
  skip_before_filter :update_activity_time
  before_action :admin_user,     only: :destroy

  # Action: new
  # Purpose: This action creates an instance variable of the User model.
  # Functionality: Create instance variable of the User model.
  def new
  	@user = User.new
  end

  # Action: create
  # Purpose: This action saves the instance variable of User to
  #          the database.
  # Functionality: Try to save the User. If there is a problem with the
  #                parameters, redirect back to the new action, otherwise
  #                sign in the user, flash a succes message, and redirect
  #                to the user's homepage.
  def create
    @user = User.new(user_params)
    @user.valid? #ensures we see all errors on the model in the view if the captcha fails

    if verify_recaptcha(:user => @user, :message => "Please enter the correct captcha!") && @user.save 
      #sign_in @user
      # Tell the UserMailer to send a welcome Email after save
      UserMailer.welcome_email(@user).deliver
      flash[:success] = "Welcome to WebPHR. An email confirmation has been sent to you with an activation code."
      #redirect_to @user
      redirect_to activate_path
    else
      render 'new'
    end
  end

  # Action: show
  # Purpose: Render the user's homepage.
  # Functionality: Fetch the current user from the databse into memory.
  #                Fetch the PHRs belonging to the current user and
  #                display them on the user's homepage.
  def show
    @user = User.find(params[:id])
    @phrs = @user.phrs.paginate(page: params[:page], per_page: 5)
  end

  #def edit
  #end

  # Action: update
  # Purpose: Update the User attributes.
  # Functionality: Try to update the user's details. If there is a problem
  #                with the parameters, redirect back to the edit page,
  #                otherwise flash a success message and redirect to the
  #                user's homepage.
  def update
    if @user.update_attributes(user_params) && verify_recaptcha(:user => @user, :message => "Please enter the correct captcha!")
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  # Action: destroy
  # Purpose: Destroy a User
  # Functionality: Destroy the user. Flash a success message. Redirect to
  #                the homepage
  def destroy
    User.destroy
    flash[:success] = "User account deleted."
    redirect_to(root_url)
  end

  # Private Definitions
  private

    # user_params
    # These are the parameters permitted when submitting a request related
    # to a User record. This protects against malicious HTTP requests
    # trying to update a User (for example flagging the admin attribute
    # as true).
    def user_params
      params.require(:user).permit( :name,
                                    :email,
                                    :password,
                                    :password_confirmation)
    end

    # Before filters
    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in."
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
