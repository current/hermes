class Appointment < ActiveRecord::Base
  validates_presence_of :name, :begin_at

  default_scope -> { order(:begin_at) }
  scope :outdated, -> { where('begin_at < ?', Time.zone.now + 1.day) }
  scope :pending, -> { where(notified: false) }
  scope :at, -> (ts) { where('DATE(begin_at) = ?', ts.to_date) }

  def self.notify!
    pending.outdated.find_each { |a| a.notify! }
  end

  def notify!
    client = Twilio::REST::Client.new

    client.messages.create \
      from: ENV['TWILIO_FROM'],
      to: number,
      body: name

    update(notified: true)
  end

  def number
    country + area + phone
  end

  def country
    '+55'
  end
end
