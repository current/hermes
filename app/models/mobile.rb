class Mobile < ActiveRecord::Base
  belongs_to :notification

  def number=(number)
    values = number.match(/^\+(\d+)-(\d+)-(\d+)/).captures

    %i[country area subscriber].each do |field|
      self[field] = values.shift
    end
  end

  def number
    "+#{country}-#{area}-#{subscriber}"
  end

  def notify(body)
    client = Twilio::REST::Client.new

    client.messages.create \
      from: ENV['TWILIO_FROM'],
      to: number,
      body: body
  end
end
