require 'rails_helper'

RSpec.describe "appointments/edit", type: :view do
  before(:each) do
    @appointment = assign(:appointment, Appointment.create!(
      :name => "MyString",
      :area => "MyString",
      :phone => "MyString",
      :notify => false
    ))
  end

  it "renders the edit appointment form" do
    render

    assert_select "form[action=?][method=?]", appointment_path(@appointment), "post" do

      assert_select "input#appointment_name[name=?]", "appointment[name]"

      assert_select "input#appointment_area[name=?]", "appointment[area]"

      assert_select "input#appointment_phone[name=?]", "appointment[phone]"

      assert_select "input#appointment_notify[name=?]", "appointment[notify]"
    end
  end
end
