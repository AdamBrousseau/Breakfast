class BglucosesController < ApplicationController

	############################################################
  	#
  	#   Controller: Bglucoses
  	#   Associated Model: Bglucose
  	#   Purpose: This controller is responsible for all the
  	#             actions associated with the Bglucose (blood 
  	#			  glucose) model.
  	#   Actions: index, new, create, show, edit, update, destroy
  	#
  	############################################################

  	# Action: index
  	# Purpose: Provide data for index view to list all bglucose records
  	# Functionality: All bglucose records related to the give Phr are
  	# 				returned in the instance variable bglucoses and are
  	# 				also paginated with 5 records showing per page.
  	def index
		@phr = Phr.find(params[:phr_id])
		@bglucoses = @phr.bglucoses.paginate(page: params[:page], per_page: 5)
		#@bglucoses = @phr.bglucoses.all
	end

	# Action: new
  	# Purpose: This action creates an instance variable of the bglucose model
  	# 		  for the given Phr.
  	# Functionality: Create instance variable of the bglucose model.
	def new
		@phr = Phr.find(params[:phr_id])
		@bglucose = @phr.bglucoses.build
	end
	
	# Action: create
  	# Purpose: This action saves the instance variable of bglucose record to the database.
  	# Functionality: Try to save the new record against the given Phr. If there is 
  	# 				 a problem with the parameters,
  	#                redirect back to the new action, otherwise flash a success
  	#                message, and redirect to the newly saved record.
	def create
		@phr = Phr.find(params[:phr_id])
		@bglucose = @phr.bglucoses.build(bglucose_params)

		if @bglucose.save
	    	flash[:success] = "Blood Glucose Record Created"
    		redirect_to(phr_bglucose_path(@bglucose.phr, @bglucose))
    	else
    		render 'new'
   		end
	end

	# Action: show
  	# Purpose: Provide data to show view to render each individual bglucose record.
  	# Functionality: Fetch the bglucose record selected by the user from the databse into memory
  	# 				using the ID of the bglucose record for the given Phr.
	def show
    	@phr = Phr.find(params[:phr_id])
		@bglucose = @phr.bglucoses.find(params[:id])
  	end

  	# Action: edit
	# Purpose: This action creates an instance variable of the bglucose model
	# 		  for the given Phr.
	# Functionality: Create instance variable of the bglucose model.
	def edit
		@phr = Phr.find(params[:phr_id])
		@bglucose = @phr.bglucoses.find(params[:id])
	end

	# Action: update
  	# Purpose: Update the bglucose record attributes.
  	# Functionality: Try to update the record's details. If there is a problem with
  	#                the parameters, redirect back to the edit page, otherwise
  	#                flash a success message and redirect to the current record's page.
	def update
    	@phr = Phr.find(params[:phr_id])
		@bglucose = @phr.bglucoses.find(params[:id])
   		if @bglucose.update_attributes(bglucose_params)
      		flash[:success] = "Record updated"
      		redirect_to(phr_bglucose_path(@bglucose.phr, @bglucose))
    	else
      		render 'edit'
    	end
  	end

  	# Action: destroy
  	# Purpose: Delete the bglucose record from the Database
  	# Functionality: Destroy the bglucose record. Flash a success message. 
  	#                Redirect to the index view for bglucose records
	def destroy
		@phr = Phr.find(params[:phr_id])
		@bglucose = @phr.bglucoses.find(params[:id])
		if @bglucose.update_attribute(:deleted, true)
	      flash[:success] = "Record Deleted."
	    else
      
	    end
	    redirect_to(phr_bglucoses_path)
  	end

  	# Private definitions
	private
		# bglucose_params
    	# These are the parameters permitted when submitting a request related
    	# to a bglucose record. This protects against malicious HTTP requests trying to
    	# update a bglucose record.
		def bglucose_params
			params.require(:bglucose).permit(:phr_id,
										:date,
										:sugar,
										:btype,
										:comments)
		end
end
