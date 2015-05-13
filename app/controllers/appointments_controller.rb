class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]

  def new
    @appointment = Appointment.new
  end

  def create
    byebug
    @appointment = Appointment.new(appointment_params)

    if @appointment.save
      redirect_to today_path, notice: 'Appointment was successfully created.'
    else
      render :new
    end
  end

  def update
    if @appointment.update(appointment_params)
      redirect_to today_path, notice: 'Appointment was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @appointment.destroy
    redirect_to appointments_url, notice: 'Appointment was successfully destroyed.'
  end

  private
    def set_appointment
      @appointment = Appointment.find(params[:id])
    end

    def appointment_params
      params.require(:appointment).permit(:name, :area, :phone, :begin_at, :notify, :notify_at)
    end
end
