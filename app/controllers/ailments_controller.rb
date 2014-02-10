class AilmentsController < ApplicationController

	def index
		@phr = Phr.find(params[:phr_id])
	end
	
	def create
		@phr = Phr.find(params[:phr_id])
		@ailment = @phr.ailments.create(params[:ailment].permit(:ailment_name, :begin_date, :end_date, :ailment_description))
		redirect_to phr_path(@phr)
	end

	def edit
	end
	

end
