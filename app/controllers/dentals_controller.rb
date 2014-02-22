class DentalsController < ApplicationController

  def index
    @phr = Phr.find(params[:phr_id])
  end
  
  def create
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
  end

  private
    def dental_params
      params.require(:dental).permit(:dentist,
                      :last_cleaning)
    end
end
