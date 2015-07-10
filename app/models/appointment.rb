require 'csv'
require 'zenvia'

class Appointment < ActiveRecord::Base
  attr_readonly :uuid

  belongs_to :user

  validates_presence_of :name, :area, :phone, :begin_at, :uuid
  validates_inclusion_of :status, in: %w[ none waiting confirmed canceled ]
  validate :area_format, :phone_format

  scope :live, -> { where.not(status: 'canceled') }
  scope :pending, -> { where(status: 'none').where('begin_at < ?', 1.day.since) }
  scope :at, -> (ts) { where('begin_at > ? AND begin_at <= ?', ts.midnight, ts.tomorrow.midnight) }

  default_scope -> { order(:begin_at) }

  before_validation :set_uuid, on: :create

  def self.notify!
    pending.find_each { |a| a.notify! }
  end

  def parse(msg)
    update(status: 'confirmed') if msg.strip =~ /\A(sim|s)[.]?\z/i
  end

  def notify!
    provider = Zenvia.new
    provider.send(number, message)
    update(status: 'waiting')
  end

  def number
    "55#{(area + phone).gsub(/\D/, '')}"
  end

  def message
    user.message(I18n.l(begin_at, format: :shortest))
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

  def set_uuid
    write_attribute(:uuid, SecureRandom.uuid)
  end
end
