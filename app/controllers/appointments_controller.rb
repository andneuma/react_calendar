class AppointmentsController < ApplicationController
  def index
    @appointment = Appointment.new
    populate_appointments
  end

  def create
    @appointment = Appointment.create(appt_params)
    populate_appointments
  end

  private

  def appt_params
    params.require(:appointment).permit(:title, :appt_time)
  end

  def populate_appointments
    @appointments = Appointment.all.sort_by(&:appt_time)
  end
end
