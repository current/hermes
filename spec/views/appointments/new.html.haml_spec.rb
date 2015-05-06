require 'rails_helper'

RSpec.describe "appointments/new", type: :view do
  before(:each) do
    assign(:appointment, Appointment.new(
      :name => "MyString",
      :area => "MyString",
      :phone => "MyString",
      :notify => false
    ))
  end

  it "renders new appointment form" do
    render

    assert_select "form[action=?][method=?]", appointments_path, "post" do

      assert_select "input#appointment_name[name=?]", "appointment[name]"

      assert_select "input#appointment_area[name=?]", "appointment[area]"

      assert_select "input#appointment_phone[name=?]", "appointment[phone]"

      assert_select "input#appointment_notify[name=?]", "appointment[notify]"
    end
  end
end
