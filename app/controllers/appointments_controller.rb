class AppointmentsController < ApplicationController
  helper_method :time
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]

  def index
    @appointments = Appointment.at(time)
  end

  def new
    @appointment = Appointment.new
  end

  def create
    @appointment = Appointment.new(appointment_params)

    if @appointment.save
      redirect_to :appointments, notice: 'Appointment was successfully created.'
    else
      render :new
    end
  end

  def update
    if @appointment.update(appointment_params)
      redirect_to @appointment, notice: 'Appointment was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @appointment.destroy
    redirect_to :appointments, notice: 'Appointment was successfully destroyed.'
  end

  private
  def set_appointment
    @appointment = Appointment.find(params[:id])
  end

  def appointment_params
    params.require(:appointment).permit(:name, :area, :phone, :begin_at, :notify, :notify_at)
  end

  def time
    Time.zone.parse("#{year}-#{month}-#{day}")
  end

  [:year, :month, :day].each do |field|
    define_method field do
      params[field] || Time.zone.now.send(field)
    end
  end
end
