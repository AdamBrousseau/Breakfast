class MedicationsController < ApplicationController

	def index
# Function: index
# Sets up the user in the medications controller
		@phr = Phr.find(params[:phr_id])
		@user = current_user
		@medications = @phr.medications.paginate(page: params[:page], per_page: 5)
	end

	def new
# Function: new
# Builds a new medications record in thr phr
		@phr =Phr.find(params[:phr_id])
		@user = current_user
		@medication = @phr.medications.build
	end

	def create
# Function: create
# Creates a new medications record in the database and update the user view 
		@phr = Phr.find(params[:phr_id])
		@medication = @phr.medications.create(medication_params)

		if @medication.save
			flash[:success] = "Medication added!"
			redirect_to phr_medication_path(@medication.phr, @medication)
		else
			render 'new'
		end
		
	end

	def show
		@phr = Phr.find(params[:phr_id])
		@medication = @phr.medications.find(params[:id])
	end

	def edit
		@phr = Phr.find(params[:phr_id])
		@medication = Medication.find(params[:id])
		@user = current_user
	end

	def update
		@medication = Medication.find(params[:id])
		if @medication.update_attributes(medication_params)
			flash[:success] = "Record updated"
			redirect_to(phr_medication_path(@medication.phr, @medication))
		else
			render 'edit'
		end	
	end

	private
		def medication_params
			params.require(:medication).permit(:medication_name,
											  :drug,
											  :begin_date,
											  :duration,
											  :dosage,
											  :frequency,
											  :ailment,
											  :prescribing_doctor)
		end

end
