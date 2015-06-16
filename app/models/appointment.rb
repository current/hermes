class Appointment < ActiveRecord::Base
  attr_accessor :time, :date
  validates_presence_of :name, :area, :phone, :begin_at

  default_scope -> { order(:begin_at) }
  scope :after, -> (ts) { where('begin_at > ?', ts.midnight) }
  scope :before, -> (ts) { where('begin_at < ?', ts.tomorrow.midnight) }
  scope :at, -> (ts) { before(ts).after(ts) }
  scope :outdated, -> { before(Time.zone.now + 1.day) }
  scope :pending, -> { where(notified: false) }

  validate :area_format, :phone_format

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
    "+55#{(area + phone).gsub(/\D/, '')}"
  end

  private
  def area_format
    errors.add(:area, :invalid) if area !~ /\A\d\d\z/
  end

  def phone_format
    errors.add(:phone, :invalid) if phone =~ /[^\d -]/
    errors.add(:phone, :invalid) if phone.gsub(/\D/, '').size < 8
    errors.add(:phone, :invalid) if phone.gsub(/\D/, '').size > 9
  end
end
