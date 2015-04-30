require 'rails_helper'

RSpec.describe Mobile, type: :model do
  subject(:mobile) { Mobile.new(number: '+55-11-983016042') }
  it { expect(mobile.country).to eq('55') }
  it { expect(mobile.area).to eq('11') }
  it { expect(mobile.subscriber).to eq('983016042') }
end
