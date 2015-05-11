require 'rails_helper'

RSpec.describe Appointment, type: :model do
  describe ".at" do
    let(:now) { Time.zone.now }
    let(:attrs) { 72.times.map { |i| { name: i, begin_at: now + i.hours }}}
    subject(:appointments)  { Appointment.at(2.days.from_now) }
    before { Appointment.create(attrs) }

    it { expect(appointments.count).to eq(24) }
  end
end
