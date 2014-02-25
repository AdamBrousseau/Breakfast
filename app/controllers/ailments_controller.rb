class AilmentsController < ApplicationController

	def index
		@phr = Phr.find(params[:phr_id])
		@ailments = @phr.ailments.paginate(page: params[:page], per_page: 5)
	end
	
	def new
		@phr = Phr.find(params[:phr_id])
		@ailment = @phr.ailments.build
	end

	def create
		@phr = Phr.find(params[:phr_id])
		@ailment = @phr.ailments.build(ailment_params)

		if @ailment.save
	    	flash[:success] = "Ailment Created!"
    		redirect_to phr_ailment_path(@ailment.phr, @ailment)
    	else
      		render 'new'
   		end
	end

	def show
		@phr = Phr.find(params[:phr_id])
		@ailment = @phr.ailments.find(params[:id])
	end

	def edit
		@phr = Phr.find(params[:phr_id])
		@ailment = Ailment.find(params[:id])
	end

	def update
		@ailment = Ailment.find(params[:id])
		if @ailment.update_attributes(ailment_params)
			flash[:success] = "Record updated"
			redirect_to(phr_ailment_path(@ailment.phr, @ailment))
		else
			reder 'edit'
		end
	end

	private
		def ailment_params
			params.require(:ailment).permit(:ailment_name,
											:begin_date,
											:end_date,
											:ailment_description)
		end
end
