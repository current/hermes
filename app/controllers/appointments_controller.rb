class AppointmentsController < ApplicationController
  include Authenticated

  helper_method :time
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]

  def index
    @appointments = current_user.appointments.at(time)
  end

  def new
    @appointment = current_user.appointments.new
  end

  def create
    @appointment = current_user.appointments.new(appointment_params)

    if @appointment.save
      redirect_to [:date, @appointment.to_date], notice: 'Compromisso adicionado'
    else
      render :new
    end
  end

  def update
    if @appointment.update(appointment_params)
      redirect_to [:date, @appointment.to_date], notice: 'Compromisso alterado'
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
    @appointment = current_user.appointments.find(params[:id])
  end

  def appointment_params
    params.require(:appointment).permit(:name, :area, :phone, :begin_at, :notify, :notify_at)
  end

  def time
    today = Time.zone.today

    year = params[:year] || today.year
    month = params[:month] || today.month
    day = params[:day] || today.day

    Time.zone.parse("#{year}-#{month}-#{day}")
  end
end
