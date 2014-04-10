class AppointmentsController < ApplicationController
  def index
# Function: index
# Sets up the user in the appointment controller
    @phr = Phr.find(params[:phr_id])
    @appointments = @phr.appointments.paginate(page: params[:page], per_page: 5)
  end
  
  def new
# Function: new
# Builds a new appointment in thr phr
    @phr = Phr.find(params[:phr_id])
    @user = current_user
    @appointment = @phr.appointments.build
  end

  def create
# Function: create
# Creates a new appointment in the database and update the user view 
    @phr = Phr.find(params[:phr_id])
    @appointment = @phr.appointments.build(appointment_params)


    if @appointment.save
        flash[:success] = "Appointment Created"
        redirect_to phr_appointment_path(@appointment.phr, @appointment)
      else
          render 'new'
      end
  end

  def show
# Function: show
# Finds appointment that belong to the phr and shows them
    @phr = Phr.find(params[:phr_id])
    @appointment = @phr.appointments.find(params[:id])
  end

  def edit
# Function: edit
# Allows the user to edit an appointment
    @phr = Phr.find(params[:phr_id])
    @appointment = Appointment.find(params[:id])
    @user = current_user
  end

  def update
# Function: update
# Updates the database record, flashes a success message and redirect the user to their phr
    @appointment = Appointment.find(params[:id])
    if @appointment.update_attributes(appointment_params)
        flash[:success] = "Record updated"
        redirect_to(phr_appointment_path(@appointment.phr, @appointment))
      else
        render 'edit'
      end
  end

  def destroy
# Function: destory
# Updates the delted column of the appointment record, shows success message and redirects user to their phr
    @phr = Phr.find(params[:phr_id])
    @appointment = @phr.appointments.find(params[:id])
    if @appointment.destroy
      flash[:success] = "Record Deleted"
    else
      flash[:error] = "Error Deleting Record"
    end
    redirect_to(phr_appointments_path)
  end

  def calendar_view
    @appointments = Appointment.all
  end

  private
    def appointment_params
# Permitted parameters for appointments
      params.require(:appointment).permit(:doctor,
                      :reason,
                      :appointment_date,
                      :results)
    end
end
