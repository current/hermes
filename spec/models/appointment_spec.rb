require 'rails_helper'

describe Appointment do
  subject :appointment do
    Appointment.new \
      name: 'John Doe',
      area: '11',
      phone: '987654321',
      begin_at: 1.day.from_now
  end

  it { should be_valid }
  it { should_not be_notified }
  it { expect(appointment.number).to eq('+5511987654321') }

  describe 'being notified' do
    let(:client) { double.as_null_object }

    before do
      allow(Twilio::REST::Client).to receive(:new) { client }
      appointment.notify!
    end

    it { should be_notified }
  end

  describe 'fetch by date' do
    subject(:appointments)  { Appointment.at(2.days.from_now) }

    before do
      now = Time.zone.now

      72.times.map do |i|
        Appointment.create \
          name: "Client #{i}",
          area: '11',
          phone: '987654321',
          begin_at: now + i.hours
      end
    end

    it { expect(appointments.count).to eq(24) }
  end
end
