require 'rails_helper'

RSpec.describe "notifications/show", type: :view do
  before(:each) do
    @notification = assign(:notification, Notification.create!(
      body: 'New notification',
      trigger_at: 1.day.from_now
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/New notification/)
  end
end
