class CalendarsController < ApplicationController
  def show
    @appointments = Appointment.at(time)
  end

  private
  def time
    if year && month && day
      Time.zone.parse("#{year}-#{month}-#{day}")
    else
      Time.zone.today
    end
  end

  [:year, :month, :day].each do |field|
    define_method field do
      params[field]
    end
  end
end
