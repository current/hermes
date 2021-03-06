require 'rails_helper'

describe Appointment do
  subject :appointment do
    Appointment.new \
      name: 'John Doe',
      area: '11',
      phone: '987654321',
      begin_at: '2015-12-31 9:30'
  end

  it { should be_valid }
  it { should_not be_notified }
  it { expect(appointment.number).to eq('+5511987654321') }

  describe 'area' do
    it 'with too many chars' do
      appointment.area = '111'
      should_not be_valid
    end

    it 'with few chars' do
      appointment.area = '1'
      should_not be_valid
    end

    it 'with letters' do
      appointment.area = '1x'
      should_not be_valid
    end
  end

  describe 'phone' do
    it 'with exotic format' do
      appointment.phone = '9 8765-4321'
      should be_valid
    end

    it 'with too many chars' do
      appointment.phone = '9876543210'
      should_not be_valid
    end

    it 'with few chars' do
      appointment.phone = '9876543'
      should_not be_valid
    end

    it 'with letters' do
      appointment.phone = '98765432X'
      should_not be_valid
    end
  end

  describe 'begin at' do
    subject(:begin_at) { appointment.begin_at }

    it { expect(begin_at.year).to eq(2015) }
    it { expect(begin_at.month).to eq(12) }
    it { expect(begin_at.day).to eq(31) }
    it { expect(begin_at.hour).to eq(9) }
    it { expect(begin_at.min).to eq(30) }
  end

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
