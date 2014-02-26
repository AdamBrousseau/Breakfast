class ImmunizationsController < ApplicationController
  def index
	  @phr = Phr.find(params[:phr_id])
  end
  
  def create
    @phr = Phr.find(params[:phr_id])
    @immunization = @phr.immunizations.create(params[:immunization].permit(:immunization,:date,:expiry))
    if @immunization.save
      flash[:success] = "Immunization Added!"
      redirect_to phr_path(@phr)
    else
      rener 'new'
    end
  end
  
  def delete
    @phr = Phr.find(params[:phr_id])
    @immunization = @phr.immunization.find(params[:id])
    @immunization.destroy #change to update and change the delete flag 
    redirect_to phr_path(@phr)
  end

  def edit
    @immunization = @phr.immunization.find(params[:id])
  end

  def update
    @immunization = @phr.immunization..find(params[:id])
    if @immunization.update(params[:immunization].permit(:immunization, :date, :expiry))
      redirect_to phr_path(@phr)
    else
      render 'edit'
    end
  end
  
end