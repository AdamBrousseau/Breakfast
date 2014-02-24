class EyesController < ApplicationController
	#before_action :signed_in_user
  	#before_action :correct_user

	def index
		@phr = Phr.find(params[:phr_id])
		#@eyes = @phr.eyes.paginate(page: params[:page], per_page: 5)
		@eyes = @phr.eyes.all
	end

	def new
		@phr = Phr.find(params[:phr_id])
		@eye = @phr.eyes.build
	end
	
	def create
		@phr = Phr.find(params[:phr_id])
		@eye = @phr.eyes.create(eye_params)

		if @eye.save
	    	flash[:success] = "Optometrist Record Created"
    		redirect_to(phr_eyes_path(@phr, @eye))
    	else
    		render 'new'
   		end
	end

	def show
    	@phr = Phr.find(params[:phr_id])
		@eye = @phr.eyes.find(params[:id])
  	end

	def edit
		@phr = Phr.find(params[:phr_id])
		@eye = Eye.find(params[:id])
	end

	def update
    @eye = Eye.find(params[:id])
    if @eye.update_attributes(eye_params)
      flash[:success] = "Record updated"
      redirect_to(phr_eye_path(@eye.phr, @eye))
    else
      render 'edit'
    end
  end

	def destroy
		@phr = Phr.find(params[:phr_id])
		@eyes = @phr.eyes.all
		@eye = @phr.eyes.find(params[:id])
		if @eye.update_attribute(:deleted, true)
	      flash[:success] = "Record Deleted."
	    else
      
	    end
	    redirect_to(phr_eyes_path)

  end

	private
		def eye_params
			params.require(:eye).permit(:phr_id,
										:date,
										:doctor,
										:glass_od_sph,
										:glass_od_cyl,
										:glass_od_axis,
										:glass_od_prism,
										:glass_od_base,
										:glass_od_add,
										:glass_os_sph,
										:glass_os_cyl,
										:glass_os_axis,
										:glass_os_prism,
										:glass_os_base,
										:glass_os_add,
										:cont_od_pwr,
										:cont_od_bc,
										:cont_od_dia,
										:cont_od_cyl,
										:cont_od_axis,
										:cont_od_add,
										:cont_od_colour,
										:cont_od_brand,
										:cont_os_pwr,
										:cont_os_bc,
										:cont_os_dia,
										:cont_os_cyl,
										:cont_os_axis,
										:cont_os_add,
										:cont_os_colour,
										:cont_os_brand,
										:comment,
										:comment2)
		end

		# Before filters

	  def signed_in_user
	      unless signed_in?
	        store_location
	        redirect_to signin_url, notice: "Please sign in."
	      end
	    end

	    def correct_user
	      @phr = current_user.phrs.find_by(id: params[:id])
	      redirect_to root_url if @phr.nil?
	    end

	    def current_phr
	      @phr = current_user.phrs.find_by(id: params[:phr_id])
	      redirect_to root_url if @phr.nil?
	    end
end
