class AllergiesController < ApplicationController
  def index
# Function: index
# Sets up the user in the allergy controller
    @phr = Phr.find(params[:phr_id])
    @allergies = @phr.allergies.paginate(page: params[:page], per_page: 5)
  end
  
  def new
# Function: new
# Builds a new allergy in thr phr
    @phr = Phr.find(params[:phr_id])
    @allergy = @phr.allergies.build
  end


  def create
# Function: create
# Creates a new allergy record in the database and update the user view 
    @phr = Phr.find(params[:phr_id])
    @allergy = @phr.allergies.build(allergy_params)

    if @allergy.save
        flash[:success] = "Allergy Created"
        redirect_to phr_allergy_path(@allergy.phr, @allergy)
      else
          render 'new'
      end
  end

  def show
# Function: show
# Finds ailments that belong to the phr and shows them
    @phr = Phr.find(params[:phr_id])
    @allergy = @phr.allergies.find(params[:id])
  end

  def edit
# Function: edit
# Allows the user to edit an allergy record
    @phr = Phr.find(params[:phr_id])
    @allergy = @phr.allergies.build
  end

  def update
# Function: update
# Updates the database record, flashes a success message and redirect the user to their phr
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
# Function: destory
# Updates the delted column of the allergy record, shows success message and redirects user to their phr
    @phr = Phr.find(params[:phr_id])
    @allergies = @phr.allergies.all
    @allergy = @phr.allergies.find(params[:id])
    if @allergy.update_attribute(:deleted, true)
      flash[:success] = "Record Deleted"
    else

    end
    redirect_to(phr_allergies_path)
  end

  private
    def allergy_params
# Permitted parameters for allergies
      params.require(:allergy).permit(:allergy_name,
                                      :allergy_description)
    end
end
