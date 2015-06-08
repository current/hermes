class CalendarsController < ApplicationController
  helper_method :time

  def show
    @appointments = Appointment.at(time)
  end

  private
  def time
    Time.zone.parse("#{year}-#{month}-#{day}")
  end

  [:year, :month, :day].each do |field|
    define_method field do
      params[field] || Time.zone.now.send(field)
    end
  end
end
