class DentalsController < ApplicationController

  def index
# Function: index
# Sets up the user in the dental controller
    @phr = Phr.find(params[:phr_id])
  end
  
  def create
# Function: create
# Creates a new dental record in the database and update the user view 
    @phr = Phr.find(params[:phr_id])
    @dental = @phr.dentals.create(dental_params)

    if @dental.save
        flash[:success] = "Dental Record Created!"
        redirect_to phr_path(@phr)
      else
          render 'new'
      end
  end

  def edit
# Function: edit
  end

  private
    def dental_params
# Permitted parameters for dental records
      params.require(:dental).permit(:dentist,
                      :last_cleaning)
    end
end
