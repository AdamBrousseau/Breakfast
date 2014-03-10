class BglucosesController < ApplicationController
  def index
		@phr = Phr.find(params[:phr_id])
		@bglucoses = @phr.bglucoses.paginate(page: params[:page], per_page: 5)
		#@bglucoses = @phr.bglucoses.all
	end

	def new
		@phr = Phr.find(params[:phr_id])
		@bglucose = @phr.bglucoses.build
	end
	
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

	def show
    	@phr = Phr.find(params[:phr_id])
		@bglucose = @phr.bglucoses.find(params[:id])
  	end

	def edit
		@phr = Phr.find(params[:phr_id])
		@bglucose = @phr.bglucoses.find(params[:id])
	end

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

	def destroy
		@phr = Phr.find(params[:phr_id])
		@bglucoses = @phr.bglucoses.all
		@bglucose = @phr.bglucoses.find(params[:id])
		if @bglucose.update_attribute(:deleted, true)
	      flash[:success] = "Record Deleted."
	    else
      
	    end
	    redirect_to(phr_bglucoses_path)

  end

	private
		def bglucose_params
			params.require(:bglucose).permit(:phr_id,
										:date,
										:sugar,
										:btype,
										:comments)
		end
end
