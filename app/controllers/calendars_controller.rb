class CalendarsController < ApplicationController
  def day
    @date = parse_date(params)
    @appointments = Appointment.where('begin_at > ? and begin_at < ?', @date.midnight, @date.tomorrow.midnight)
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
end
