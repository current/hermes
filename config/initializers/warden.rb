Rails.application.config.middleware.use Warden::Manager
Warden::Manager.serialize_into_session { |user| user.id }
Warden::Manager.serialize_from_session { |id| User.find(id) }

Warden::Strategies.add(:password) do
  def valid?
    params['email'] && params['password']
  end

  def authenticate!
    user = User.find_by(email: params['email'])

    if user.authenticate(params['password'])
      success! user
    else
      fail!
    end
  end
end
