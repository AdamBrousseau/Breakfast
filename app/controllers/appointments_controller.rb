class AppointmentsController < ApplicationController

  def index
    @phr = Phr.find(params[:phr_id])
  end
  
  def create
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
  end

  private
    def appointment_params
      params.require(:appointment).permit(:doctor,
                      :reason,
                      :results)
    end
end
