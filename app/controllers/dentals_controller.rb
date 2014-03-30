class DentalsController < ApplicationController
  def index
# Function: index
# Sets up the user in the dental controller
    @phr = Phr.find(params[:phr_id])
    @dentals = @phr.dentals.paginate(page: params[:page], per_page: 5)
  end
  
  def new
# Function: new
# Builds a new dental record in thr phr
    @phr = Phr.find(params[:phr_id])
    @dental = @phr.dentals.build
  end


  def create
# Function: create
# Creates a new dental record in the database and updates the user view 
    @phr = Phr.find(params[:phr_id])
    @dental = @phr.dentals.build(dental_params)

    if @dental.save
        flash[:success] = "dental Created"
        redirect_to phr_dental_path(@dental.phr, @dental)
      else
          render 'new'
      end
  end

  def show
# Function: show
# Finds ailments that belong to the phr and shows them
    @phr = Phr.find(params[:phr_id])
    @dental = @phr.dentals.find(params[:id])
  end

  def edit
# Function: edit
# Allows the user to edit a dental record
    @phr = Phr.find(params[:phr_id])
    @dental = @phr.dentals.build
  end

  def update
# Function: update
# Updates the database record, flashes a success message and redirect the user to their phr
    @phr = Phr.find(params[:phr_id])
      @dental = @phr.dentals.find(params[:id])
      if @dental.update_attributes(dental_params)
        flash[:success] = "Record updated"
        redirect_to phr_path(@phr)
      else
        render 'edit'
      end
  end

  def destroy
# Function: destory
# Updates the delted column of the dental record, shows success message and redirects user to their phr
    @phr = Phr.find(params[:phr_id])
    @dentals = @phr.dentals.all
    @dental = @phr.dentals.find(params[:id])
    if @dental.update_attribute(:deleted, true)
      flash[:success] = "Record Deleted"
    else

    end
    redirect_to(phr_dentals_path)
  end

  private
    def dental_params
# Permitted parameters for dentals
      params.require(:dental).permit(:dentist,
                                     :last_visit,
                                     :description,
                                     :additional_notes)
    end
end
