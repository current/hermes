class Notification < ActiveRecord::Base
  has_many :mobiles

  scope :outdated, -> { where('trigger_at < ?', Time.zone.now) }
  scope :pending, -> { where(done: false) }

  validates_presence_of :body, :trigger_at

  def self.run!
    pending.outdated.find_each { |poke| poke.run! }
  end

  def run!
    mobiles.pending.each { |mobile| mobile.notify(body) }
    update(done: true)
  end
end
