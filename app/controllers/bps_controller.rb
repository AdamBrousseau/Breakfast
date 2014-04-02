class BpsController < ApplicationController

	############################################################
  	#
  	#   Controller: Bps
  	#   Associated Model: Bp
  	#   Purpose: This controller is responsible for all the
  	#            actions associated with the Bp (blood pressure)
  	# 			 model 
  	#   Actions: index, new, create, show, edit, update, destroy
  	#
  	############################################################

  	# Action: index
  	# Purpose: Provide data for index view to list all bp records
  	# Functionality: All bp records related to the give Phr are
  	# 				returned in the instance variable bps and are
  	# 				also paginated with 5 records showing per page.
  	def index
		@phr = Phr.find(params[:phr_id])
		@bps = @phr.bps.paginate(page: params[:page], per_page: 5)
		#@bps = @phr.bps.paginate(page: params[:page], per_page: 5)
	end

	# Action: new
  	# Purpose: This action creates an instance variable of the bp model
  	# 		  for the given Phr.
  	# Functionality: Create instance variable of the bp model.
	def new
		@phr = Phr.find(params[:phr_id])
		@bp = @phr.bps.build
	end
	
	# Action: create
  	# Purpose: This action saves the instance variable of bp record to the database.
  	# Functionality: Try to save the new record against the given Phr. If there is 
  	# 				 a problem with the parameters,
  	#                redirect back to the new action, otherwise flash a success
  	#                message, and redirect to the newly saved record.
	def create
		@phr = Phr.find(params[:phr_id])
		@bp = @phr.bps.build(bp_params)

		if @bp.save
	    	flash[:success] = "Blood Pressure Record Created"
    		redirect_to(phr_bp_path(@bp.phr, @bp))
    	else
    		render 'new'
   		end
	end

	# Action: show
  	# Purpose: Provide data to show view to render each individual bp record.
  	# Functionality: Fetch the bp record selected by the user from the databse into memory
  	# 				using the ID of the bp record for the given Phr.
	def show
    	@phr = Phr.find(params[:phr_id])
		@bp = @phr.bps.find(params[:id])
  	end

  	# Action: edit
	# Purpose: This action creates an instance variable of the Bp model
	# 		  for the given Phr.
	# Functionality: Create instance variable of the Bp model.
	def edit
		@phr = Phr.find(params[:phr_id])
		@bp = @phr.bps.find(params[:id])
	end

	# Action: update
  	# Purpose: Update the bp record attributes.
  	# Functionality: Try to update the record's details. If there is a problem with
  	#                the parameters, redirect back to the edit page, otherwise
  	#                flash a success message and redirect to the current record's page.
	def update
		@phr = Phr.find(params[:phr_id])
	    @bp = @phr.bps.find(params[:id])
	    if @bp.update_attributes(bp_params)
	      flash[:success] = "Record updated"
	      redirect_to(phr_bp_path(@bp.phr, @bp))
	    else
	      render 'edit'
	    end
 	end

 	# Action: destroy
  	# Purpose: Delete the bp record from the Database
  	# Functionality: Destroy the bp record. Flash a success message. Redirect to the
  	#                index view for bp records
	def destroy
		@phr = Phr.find(params[:phr_id])
		@bp = @phr.bps.find(params[:id])
		@bp.destroy
	    redirect_to(phr_bps_path)
 	end

 	#Private definitions
	private
		# bp_params
    	# These are the parameters permitted when submitting a request related
    	# to a bp record. This protects against malicious HTTP requests trying to
    	# update a bp record.
		def bp_params
			params.require(:bp).permit(:phr_id,
										:date,
										:systolic,
										:diastolic)
		end
end
