class AllergiesController < ApplicationController

  def index
    @phr = Phr.find(params[:phr_id])
  end
  
  def create
    @phr = Phr.find(params[:phr_id])
    @allergy = @phr.allergies.create(allergy_params)

    if @allergy.save
        flash[:success] = "Allergy Created!"
        redirect_to phr_path(@phr)
      else
          render 'new'
      end
  end

  def edit
  end

  private
    def allergy_params
      params.require(:allergy).permit(:allergy_name,
                      :allergy_description)
    end
end
