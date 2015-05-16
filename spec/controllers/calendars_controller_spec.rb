require 'rails_helper'

RSpec.describe CalendarsController, type: :controller do

  describe "GET #today" do
    it "returns http success" do
      get :today
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #month" do
    it "returns http success" do
      get :month, month: '02', year: '1982'
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #day" do
    it "returns http success" do
      get :day, day: '02', month: '02', year: '1982'
      expect(response).to have_http_status(:success)
    end
  end

end
