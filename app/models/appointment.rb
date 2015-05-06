class Appointment < ActiveRecord::Base
  validates_presence_of :name, :begin_at
  validates_presence_of :notify_at, :if => :notify

  scope :outdated, -> { where('notify_at < ?', Time.zone.now) }
  scope :pending, -> { where(notify: true, notified: false) }

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
