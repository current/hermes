class CalendarsController < ApplicationController
  def today
    @date = Date.today
    @appointments = Appointment.at(@date)
    @week = week(@date).map { |day| [day, Appointment.at(day).count] }

    render :day
  end

  def day
    @date = parse_date(params)
    @appointments = Appointment.at(@date)
    @week = week(@date).map { |day| [day, Appointment.at(day).count] }
  end

  def month
  end

  private
  def parse_date(from)
    if from[:year] && from[:month] && from[:day]
      Date.parse("#{from[:year]}-#{from[:month]}-#{from[:day]}")
    else
      Date.today
    end
  end

  def week(base)
    (1..6).map { |n| base + n.days }
  end
end
