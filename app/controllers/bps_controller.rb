class BpsController < ApplicationController
  def index
		@phr = Phr.find(params[:phr_id])
		@bps = @phr.bps.paginate(page: params[:page], per_page: 5)
		#@bps = @phr.bps.paginate(page: params[:page], per_page: 5)
	end

	def new
		@phr = Phr.find(params[:phr_id])
		@bp = @phr.bps.build
	end
	
	def create
		@phr = Phr.find(params[:phr_id])
		@bp = @phr.bps.build(bp_params)

		if @bp.save
	    	flash[:success] = "Blood Pressure Record Created"
    		redirect_to(phr_bps_path(@bp.phr, @bp))
    	else
    		render 'new'
   		end
	end

	def show
    	@phr = Phr.find(params[:phr_id])
		@bp = @phr.bps.find(params[:id])
  	end

	def edit
		@phr = Phr.find(params[:phr_id])
		@bp = @phr.bps.find(params[:id])
	end

	def update
		@phr = Phr.find(params[:phr_id])
	    @bp = @phr.bps.find(params[:id])
	    if @bp.update_attributes(bp_params)
	      flash[:success] = "Record updated"
	      redirect_to(phr_bps_path(@bp.phr, @bp))
	    else
	      render 'edit'
	    end
 	end

	def destroy
		@phr = Phr.find(params[:phr_id])
		@bps = @phr.bps.all
		@bp = @phr.bps.find(params[:id])
		@bp.destroy
	    redirect_to(phr_bps_path)
	    

  end

	private
		def bp_params
			params.require(:bp).permit(:phr_id,
										:date,
										:systolic,
										:diastolic)
		end
end
