class AilmentsController < ApplicationController

	def index
		@phr = Phr.find(params[:phr_id])
	end
	
	def create
		@phr = Phr.find(params[:phr_id])
		@ailment = @phr.ailments.create(ailment_params)

		if @ailment.save
	    	flash[:success] = "Ailment Created!"
    		redirect_to phr_path(@phr)
    	else
      		render 'new'
   		end
	end

	def edit
	end

	private
		def ailment_params
			params.require(:ailment).permit(:ailment_name,
											:begin_date,
											:end_date,
											:ailment_description)
		end

end
