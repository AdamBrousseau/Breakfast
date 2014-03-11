class AllergiesController < ApplicationController
  def index
    @phr = Phr.find(params[:phr_id])
    @allergies = @phr.allergies.paginate(page: params[:page], per_page: 5)
  end
  
  def new
    @phr = Phr.find(params[:phr_id])
    @allergy = @phr.allergies.build
  end

  def create
    @phr = Phr.find(params[:phr_id])
    @allergy = @phr.allergies.build(allergy_params)

    if @allergy.save
        flash[:success] = "Allergy Created"
        redirect_to phr_path(@phr)
      else
          render 'new'
      end
  end

  def show
    @phr = Phr.find(params[:phr_id])
    @allergy = @phr.allergies.build
  end

  def edit
    @phr = Phr.find(params[:phr_id])
    @allergy = @phr.allergies.build
  end

  def update
    @phr = Phr.find(params[:phr_id])
      @allergy = @phr.allergies.find(params[:id])
      if @allergy.update_attributes(allergy_params)
        flash[:success] = "Record updated"
        redirect_to phr_path(@phr)
      else
        render 'edit'
      end
  end

  def destroy
    @phr = Phr.find(params[:phr_id])
    @allergies = @phr.allergies.all
    @allergy = @phr.allergies.find(params[:id])
    @allergy.destroy
    redirect_to phr_path(@phr)
  end

  private
    def allergy_params
      params.require(:allergy).permit(:allergy_name,
                                      :allergy_description)
    end
end
