class Notification < ActiveRecord::Base
  has_many :mobiles

  scope :past, -> { where('trigger_at < ?', Time.zone.now) }
  scope :pending, -> { where(done: false) }

  def self.run!
    pending.past.find_each { |poke| poke.run! }
  end

  def run!
    mobiles.each { |mobile| mobile.notify(body) }
    update(done: true)
  end
end
