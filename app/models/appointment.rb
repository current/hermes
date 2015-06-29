require 'csv'
require 'zenvia'

class Appointment < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :name, :area, :phone, :begin_at
  validates_inclusion_of :status, in: %w[ none waiting confirmed canceled ]
  validate :area_format, :phone_format

  default_scope -> { order(:begin_at) }

  def self.at(ts)
    where('begin_at > ? AND begin_at < ?', ts.midnight, ts.midnight.tomorrow)
  end

  def self.pending
    where(status: 'none').where('begin_at < ?', 1.day.since)
  end

  def self.number(number)
    where('? || area || phone = ?', '55', number)
  end

  def self.notify!
    pending.find_each { |a| a.notify! }
  end

  def self.receive!
    provider = Zenvia.new
    response = provider.receive

    csv = CSV.parse(response, headers: true, col_sep: ';')

    csv.each do |row|
      next if row[3].to_i != 1
      number(row[2]).update_all(status: 'confirmed')
    end
  end

  def notify!
    provider = Zenvia.new
    provider.send(number, message)
    update(status: 'waiting')
  end

  def number
    "55#{(area + phone).gsub(/\D/, '')}"
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

  def message
    user.message(begin_at)
  end
end
