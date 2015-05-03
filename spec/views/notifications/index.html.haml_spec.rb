require 'rails_helper'

RSpec.describe "notifications/index", type: :view do
  before(:each) do
    assign(:notifications, [
      Notification.create!(
        body: 'New notification',
        trigger_at: 1.day.from_now
      ),
      Notification.create!(
        body: 'New notification',
        trigger_at: 1.day.from_now
      )
    ])
  end

  it "renders a list of notifications" do
    render
    assert_select "tr>td", text: 'New notification', count: 2
  end
end
