class AilmentsController < ApplicationController

	#Function: index
	#Sets up the user in the ailments controller
	def index
		@phr = Phr.find(params[:phr_id])
		@ailments = @phr.ailments.paginate(page: params[:page], per_page: 5)
	end
	
	#Function: new
	#builds a new ailment in phr
	def new
		@phr = Phr.find(params[:phr_id])
		@ailment = @phr.ailments.build
	end

	#Function: create
	#creates a new ailment record in the database, and updates the user view
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

	#Function: show
	#finds ailments that belong to the phr and show them
	def show
		@phr = Phr.find(params[:phr_id])
		@ailment = @phr.ailments.find(params[:id])
	end

	#Function: edit
	#alows the user to edit an ailment record
	def edit
		@phr = Phr.find(params[:phr_id])
		@ailment = Ailment.find(params[:id])
	end

	#Function: update
	#updates the database record, flashes a success message, and redirects the user to view the updated record.
	def update
		@ailment = Ailment.find(params[:id])
		if @ailment.update_attributes(ailment_params)
			flash[:success] = "Record updated"
			redirect_to(phr_ailment_path(@ailment.phr, @ailment))
		else
			render 'edit'
		end
	end

	#Function: destroy
	#updates the deleted column of the ailment record
	#flashes success messages, redirects
	def destroy
		@phr = Phr.find(params[:phr_id])
		@ailment = @phr.ailments.find(params[:id])
		if @ailment.update_attribute(:deleted, true)
			flash[:success] = "Record Deleted"
		else

		end
		redirect_to(phr_ailments_path)
	end

	private
		#definition of permitted parameters
		def ailment_params
			params.require(:ailment).permit(:ailment_name,
											:begin_date,
											:end_date,
											:ailment_description)
		end
end
