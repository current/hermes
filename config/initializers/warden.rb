Rails.application.config.middleware.use Warden::Manager do |config|
  config.default_scope = :user
  config.scope_defaults :user, strategies: [:password]
  config.failure_app = SessionsController
end

Warden::Manager.serialize_into_session { |user| user.id }
Warden::Manager.serialize_from_session { |id| User.find(id) }

Warden::Strategies.add(:password) do
  def valid?
    params['email'] && params['password']
  end

  def authenticate!
    user = User.find_by(email: params['email'])

    if user.try(:authenticate, params['password'])
      success! user
    else
      fail! 'E-mail ou senha errados'
    end
  end
end
