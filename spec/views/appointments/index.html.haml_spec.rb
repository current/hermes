require 'rails_helper'

RSpec.describe "appointments/index", type: :view do
  before(:each) do
    assign(:appointments, [
      Appointment.create!(
        :name => "Name",
        :area => "Area",
        :phone => "Phone",
        :notify => false
      ),
      Appointment.create!(
        :name => "Name",
        :area => "Area",
        :phone => "Phone",
        :notify => false
      )
    ])
  end

  it "renders a list of appointments" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Area".to_s, :count => 2
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
