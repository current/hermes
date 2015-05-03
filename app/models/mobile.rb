class Mobile < ActiveRecord::Base
  belongs_to :notification
  scope :pending, -> { where(done: false) }

  validates_presence_of :country, :area, :subscriber

  validates_format_of :country, with: /\A55\z/
  validates_format_of :area, with: /\A\d{2}\z/
  validates_format_of :subscriber, with: /\A\d{8,9}\z/

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
