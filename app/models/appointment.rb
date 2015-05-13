class Appointment < ActiveRecord::Base
  validates_presence_of :name, :begin_at

  default_scope -> { order(:begin_at) }
  scope :after, -> (ts) { where('begin_at > ?', ts.midnight) }
  scope :before, -> (ts) { where('begin_at < ?', ts.tomorrow.midnight) }
  scope :at, -> (ts) { before(ts).after(ts) }
  scope :outdated, -> { before(Time.zone.now + 1.day) }
  scope :pending, -> { where(notified: false) }

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

  def begin_at
    read_attribute(:begin_at) || Time.zone.now
  end

  def number
    country + area + phone
  end

  def country
    '+55'
  end
end
