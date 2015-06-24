require 'rails_helper'

describe UsersController do
  include Warden::Test::Helpers

  def user_params
    {
      name: 'ACME Clinic',
      email: 'john.doe@example.com',
      business: 'medical',
      password: 'foobar12'
    }
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    it "returns http success" do
      allow(request.env['warden']).to receive(:set_user)
      post :create, user: user_params
      expect(response).to have_http_status(:redirect)
    end
  end

end
