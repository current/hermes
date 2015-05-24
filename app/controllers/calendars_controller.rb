class CalendarsController < ApplicationController
  before_action :set_date

  def show
    @appointments = Appointment.at(@date)
  end

  private
  def set_date
    today = Date.today

    year = params[:year] || today.year
    month = params[:month] || today.month
    day = params[:day] || today.day

    @date = Date.parse("#{year}-#{month}-#{day}")
  end
end
