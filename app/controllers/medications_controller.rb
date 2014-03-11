class MedicationsController < ApplicationController

	def index
		@phr = Phr.find(params[:phr_id])
		@medications = @phr.medications.paginate(page: params[:page], per_page: 5)
	end

	def new
		@phr =Phr.find(params[:phr_id])
		@medication = @phr.medications.build
	end

	def create
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
