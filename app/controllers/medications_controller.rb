class MedicationsController < ApplicationController

	def index
# Function: index
# Sets up the user in the medications controller
		@phr = Phr.find(params[:phr_id])
		@medications = @phr.medications.paginate(page: params[:page], per_page: 5)
	end

	def new
# Function: new
# Builds a new medications record in thr phr
		@phr =Phr.find(params[:phr_id])
		@medication = @phr.medications.build
	end

	def create
# Function: create
# Creates a new medications record in the database and update the user view 
		@phr = Phr.find(params[:phr_id])
		@medication = @phr.ailments.build(medication_params)

		if @medication.save
			flash[:success] = "Medication added!"
			redirect_to phr_medication_path(@medication.phr, @medication)
		else
			render 'new'
		end
		
	end


end
