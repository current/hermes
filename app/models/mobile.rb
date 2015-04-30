class Mobile < ActiveRecord::Base
  belongs_to :notification
  scope :pending, -> { where(done: false) }

  def number
    "+#{country}#{area}#{subscriber}"
  end

  def notify(body)
    client = Twilio::REST::Client.new

    client.messages.create \
      from: ENV['TWILIO_FROM'],
      to: number,
      body: body

    update(done: true)
  end
end
