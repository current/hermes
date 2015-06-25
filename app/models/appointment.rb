class Appointment < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :name, :area, :phone, :begin_at
  validates_inclusion_of :status, in: %w[unknown waiting confirmed canceled]
  default_scope -> { order(:begin_at) }

  def self.at(ts)
    where('begin_at > ? AND begin_at < ?', ts.midnight, ts.midnight.tomorrow)
  end

  def self.pending
    where(status: 'pending').where('begin_at > ?', 1.day.since)
  end

  validate :area_format, :phone_format

  def self.notify!
    pending.find_each { |a| a.notify! }
  end

  def notify!
    client = Twilio::REST::Client.new

    client.messages.create \
      from: ENV['TWILIO_FROM'],
      to: number,
      body: name

    update(status: 'waiting')
  end

  def number
    "+55#{(area + phone).gsub(/\D/, '')}"
  end

  def to_date
    { year: begin_at.year, month: begin_at.month, day: begin_at.day }
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
