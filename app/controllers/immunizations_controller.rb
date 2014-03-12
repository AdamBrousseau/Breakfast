class ImmunizationsController < ApplicationController
  #Function: index
  #Sets up the user in the immunization controller
  def index
	  @phr = Phr.find(params[:phr_id])
  end
  
  #Function: create
  #Creates a new immunization record in the database and updates the user view.
  def create
    @phr = Phr.find(params[:phr_id])
    @immunization = @phr.immunizations.create(params[:immunization].permit(:immunization,:date,:expiry))
    if @immunization.save
      flash[:success] = "Immunization Added!"
      redirect_to phr_path(@phr)
    else
      render 'new'
    end
  end
  
  #Function delete
  #Removes an immunization from the database and updates the user view.
  def delete
    @phr = Phr.find(params[:phr_id])
    @immunization = @phr.immunization.find(params[:id])
    @immunization.destroy #change to update and change the delete flag 
    redirect_to phr_path(@phr)
  end

  #Function edit
  #Modifies the database and updates the user view
  def edit
    @immunization = @phr.immunization.find(params[:id])
  end

  #Function update
  #Updates the immunization record.
  def update
    @immunization = @phr.immunization.find(params[:id])
    if @immunization.update(params[:immunization].permit(:immunization, :date, :expiry))
      redirect_to phr_path(@phr)
    else
      render 'edit'
    end
  end
  
end