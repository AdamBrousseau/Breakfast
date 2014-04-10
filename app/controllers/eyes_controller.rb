class EyesController < ApplicationController
	#########################################################
	#
	#   Controller: Eyes
	#   Associated Model: Eye
	#   Purpose: This controller is responsible for all the
	#             actions associated with the Eye model
	#   Actions: index, new, create, show, edit, update, destroy
	#
	#########################################################

	# Action: index
    # Purpose: Provide data for index view to list all Eye records
    # Functionality: All Eye records related to the give Phr are
    #           returned in the instance variable eyes and are
    #           also paginated with 5 records showing per page.
	def index
		@phr = Phr.find(params[:phr_id])
		@eyes = @phr.eyes.paginate(page: params[:page], per_page: 5)
	end

	# Action: new
  	# Purpose: This action creates an instance variable of the Eye model.
  	# Functionality: Create instance variable of the Eye model.
	def new
		@user = current_user
		@phr = Phr.find(params[:phr_id])
		@eye = @phr.eyes.build		
	end
	
	# Action: create
	# Purpose: This action saves the instance variable of Eye to
	#          the database.
	# Functionality: Try to save the Eye. If there is a problem with the
	#                parameters, redirect back to the new action, otherwise
	#                flash a succes message, and redirect
	#                to the Eye Show page.
	def create
		@phr = Phr.find(params[:phr_id])
		@eye = @phr.eyes.build(eye_params)

		if @eye.save
	    	flash[:success] = "Optometrist Record Created"
    		redirect_to(phr_eye_path(@eye.phr, @eye))
    	else
    		@user = current_user
    		render 'new'
   		end
	end

	# Action: show
    # Purpose: Render the Eye Show page.
    # Functionality: Fetch the current Phr from the databse into memory.
    #                Fetch the current Eye and display the Eye Show page.
	def show
    	@phr = Phr.find(params[:phr_id])
		@eye = @phr.eyes.find(params[:id])
  	end

  	# Action: edit
    # Purpose: This action creates an instance variable of the Eye model
    #       for the given Phr.
    # Functionality: Create instance variable of the Eye model.
	def edit
		@phr = Phr.find(params[:phr_id])
		@eye = Eye.find(params[:id])
		@user = current_user
	end

	# Action: update
    # Purpose: Update the Eye attributes.
    # Functionality: Try to update the Eye's details. If there is a problem
    #                with the parameters, redirect back to the edit page,
    #                otherwise flash a success message and redirect to the
    #                Eye Show page.
	def update
	    @eye = Eye.find(params[:id])
	    if @eye.update_attributes(eye_params)
	      flash[:success] = "Record updated"
	      redirect_to(phr_eye_path(@eye.phr, @eye))
	    else
	      render 'edit'
	    end
  	end

  	# Action: destroy
    # Purpose: Destroy an Eye
    # Functionality: Destroy the Eye record. Flash a success message. Redirect to
    #                the Eyes Index Page
	def destroy
		@phr = Phr.find(params[:phr_id])
		@eye = @phr.eyes.find(params[:id])
		if @eye.destroy
	      flash[:success] = "Record Deleted."
	    else
      		flash[:error] = "Error Deleting Record"
	    end
	    redirect_to(phr_eyes_path)

  	end

 	# Private Definitions
	private

		# eye_params
	    # These are the parameters permitted when submitting a request related
    	# to an Eye record. This protects against malicious HTTP requests
    	# trying to update an Eye (for example changing the deleted flag).
		def eye_params
			params.require(:eye).permit(:phr_id,
										:date,
										:doctor,
										:glass_od_sph,
										:glass_od_cyl,
										:glass_od_axis,
										:glass_od_prism,
										:glass_od_base,
										:glass_od_add,
										:glass_os_sph,
										:glass_os_cyl,
										:glass_os_axis,
										:glass_os_prism,
										:glass_os_base,
										:glass_os_add,
										:cont_od_pwr,
										:cont_od_bc,
										:cont_od_dia,
										:cont_od_cyl,
										:cont_od_axis,
										:cont_od_add,
										:cont_od_colour,
										:cont_od_brand,
										:cont_os_pwr,
										:cont_os_bc,
										:cont_os_dia,
										:cont_os_cyl,
										:cont_os_axis,
										:cont_os_add,
										:cont_os_colour,
										:cont_os_brand,
										:comment,
										:comment2)
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

	    def current_phr
	      @phr = current_user.phrs.find_by(id: params[:phr_id])
	      redirect_to root_url if @phr.nil?
	    end
end
