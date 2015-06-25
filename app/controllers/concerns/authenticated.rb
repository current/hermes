module Authenticated
  extend ActiveSupport::Concern

  included do
    helper_method :current_user
    before_filter :verify_auth
  end

  def current_user
    warden.user
  end

  def verify_auth
    unless warden.authenticated?
      redirect_to :login, alert: 'Você precisa se autenticar'
    end
  end
end
