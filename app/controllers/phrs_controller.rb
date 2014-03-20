class PhrsController < ApplicationController
	 #########################################################
  #
  #   Controller: Phrs
  #   Associated Model: Phr
  #   Purpose: This controller is responsible for all the
  #             actions associated with the Phr model
  #   Actions: show, create, new, update, destroy
  #
  #########################################################

  # Before performing any actions, ensure the user is
  # signed_in and the correct_user is requesting the action.
  before_action :signed_in_user
  before_action :correct_user , only: [:show, :create, :destroy, :update]
  
  # Action: show
  # Purpose: Render the PHR.
  # Functionality: Fetch the current user's current PHR from the databse into
  #                memory and display it on the PHR Show page.
  def show
    @phr = current_user.phrs.find(params[:id])
  end

  # Action: create
  # Purpose: This action saves the instance variable of Phr to
  #          the database.
  # Functionality: Try to save the Phr. If there is a problem with the
  #                parameters, redirect back to the new action, otherwise
  #                flash a succes message, and redirect
  #                to the PHR Show page.
  def create
    @phr = current_user.phrs.build(phr_params)
    if @phr.save
      flash[:success] = "PHR Created!"
      redirect_to @phr
    else
      render 'new'
    end
  end
  
  # Action: new
  # Purpose: This action creates an instance variable of the Phr model.
  # Functionality: Create instance variable of the Phr model.
  def new
    @phr = current_user.phrs.build
  end

  # Action: update
  # Purpose: Update the Phr attributes.
  # Functionality: Try to update the Phr's details. If there is a problem
  #                with the parameters, redirect back to the edit page,
  #                otherwise flash a success message and redirect to the
  #                PHR Show page.
  def update
    @phr = current_user.phrs.find(params[:id])
    if @phr.update_attributes(phr_params)
      flash[:success] = "PHR updated"
      redirect_to @phr
    else
      render 'edit'
    end
  end

  # Action: destroy
  # Purpose: Destroy a Phr
  # Functionality: Destroy the Phr. Flash a success message. Redirect to
  #                the homepage
  def destroy
    if @phr.update_attribute(:deleted, true)
      flash[:success] = "PHR deleted."
    else
      
    end
    redirect_to(current_user)
  end

  # Private Definitions
  private

    # phr_params
    # These are the parameters permitted when submitting a request related
    # to a Phr record. This protects against malicious HTTP requests
    # trying to update a Phr (for example changing the deleted flag).
    def phr_params
      params.require(:phr).permit(:first_name,
                                  :last_name,
                                  :date_of_birth,
                                  :gender,
                                  :blood_type,
                                  :health_card_no)
    end

  # Before filters

    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in."
      end
    end

    def correct_user
      @phr = current_user.phrs.find_by(id: params[:id])
      redirect_to root_url if @phr.nil?
    end
    
end