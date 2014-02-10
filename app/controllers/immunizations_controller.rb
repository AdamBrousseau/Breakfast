class ImmunizationsController < ApplicationController
  def index
	@phr = Phr.find(params[:phr_id])
  end
  
  def create
    @phr = Phr.find(params[:phr_id])
    @immunization = @phr.immunizations.create(params[:immunization].permit(:immunization,:date,:expiry))
    redirect_to phr_path(@phr)
  end
  
  def delete
    @phr = Phr.find(params[:phr_id])
    @immunization = @phr.immunization.find(params[:id])
    @immunization.destroy #change to update and change the delete flag 
    redirect_to phr_path(@phr)
  end
  
end
