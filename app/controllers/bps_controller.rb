class BpsController < ApplicationController
  def index
		@phr = Phr.find(params[:phr_id])
		@bps = @phr.bps.paginate(page: params[:page], per_page: 5)
		#@bps = @phr.bps.paginate(page: params[:page], per_page: 5)
		@bps.each do |bp|
			if (bp.systolic >= 80 and bp.systolic <= 119) && (bp.diastolic >= 60 and bp.diastolic <= 79)
				bp.condition = 'Normal'
			elsif (bp.systolic >= 120 and bp.systolic <= 139) || (bp.diastolic >= 80 and bp.diastolic <= 89)
				bp.condition = 'Pre-hypertension'
			elsif (bp.systolic >= 140 and bp.systolic <= 159) || (bp.diastolic >= 90 and bp.diastolic <= 99)
				bp.condition = 'Hypertension, Stage 1'
			elsif (bp.systolic > 159) || (bp.diastolic > 99)
				bp.condition = 'Hypertension, Stage 2'
			else
				bp.condition = 'Hypotension'
			end
		end
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
