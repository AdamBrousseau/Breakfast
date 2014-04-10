class ImmunizationsController < ApplicationController
  #Function: index
  #Sets up the user in the immunization controller
  def index
	  @phr = Phr.find(params[:phr_id])
	  @immunizations = @phr.immunizations.paginate(page: params[:page], per_page: 5)
  end
  
  # Function: new
  # Builds a new immunization in thr phr  
  def new
    @phr = Phr.find(params[:phr_id])
    @immunization = @phr.immunizations.build
  end
  
  #Function: create
  #Creates a new immunization record in the database and updates the user view.
  def create
    @phr = Phr.find(params[:phr_id])
    @immunization = @phr.immunizations.build(immunization_params)
    if @immunization.save
      flash[:success] = "Immunization Added!"
      redirect_to phr_immunization_path(@immunization.phr, @immunization)
    else
      render 'new'
    end
  end
  
  # Function: show
  # Finds immunization that belong to the phr and shows them
  def show
    @phr = Phr.find(params[:phr_id])
    @immunization = @phr.immunizations.find(params[:id])
  end
  
  #Function edit
  #Modifies the database and updates the user view
  def edit
	@phr = Phr.find(params[:phr_id])
	@immunization = Immunization.find(params[:id])
  end

  #Function update
  #Updates the immunization record.
  def update
    @phr = Phr.find(params[:phr_id])
    @immunization = @phr.immunizations.find(params[:id])
    if @immunization.update_attributes(immunization_params)
		flash[:success] = "Record updated"
		redirect_to phr_immunizations_path(@immunization.phr, @immunization)
    else
      render 'edit'
    end
  end
  
  #Function destroy
  #Removes an immunization from the database and updates the user view.
  def destroy
  	@phr = Phr.find(params[:phr_id])
  	@immunization = @phr.immunizations.find(params[:id])
  	if @immunization.destroy
  		flash[:success] = "Record Deleted"
    else
      flash[:error] = "Error Deleting Record"
  	end
  	redirect_to(phr_immunizations_path)
  end
  
  #Permitted parameter for allergies
  private
	def immunization_params
		params.require(:immunization).permit(:immunization, :date, :expiry)
	end
  
end