class AppointmentsController < ApplicationController

  def index
# Function: index
# Sets up the user in the appointment controller
    @phr = Phr.find(params[:phr_id])
    @user = current_user
  end
  
  def create
# Function: create
# Creates a new appointment in the database and update the user view 
    @phr = Phr.find(params[:phr_id])
    @appointment = @phr.appointments.create(appointment_params)

    if @appointment.save
        flash[:success] = "Appointment Created!"
        redirect_to phr_path(@phr)
      else
          render 'new'
      end
  end

  def edit
  # Function: edit
  end

  private
    def appointment_params
# Permitted parameters for appointments
      params.require(:appointment).permit(:doctor,
                      :reason,
                      :results)
    end
end
