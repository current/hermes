class User < ActiveRecord::Base
  BUSINESS = %w[ medical dental aesthetic other ]
  has_many :appointments

  has_secure_password

  validates_inclusion_of :business, in: BUSINESS
  validates_uniqueness_of :email, case_sensitive: false
  validates_presence_of :email, :name

  def message(at)
    I18n.t(business, scope: 'sms', name: name, at: at)
  end
end
