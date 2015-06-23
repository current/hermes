require 'rails_helper'

describe User do
  subject(:user) do
    User.new \
      email: 'john.doe@example.com',
      name: 'John Doe',
      password: 'foobar12'
  end

  it { should be_valid }

  context 'with used e-mail' do
    subject do
      User.new \
        email: 'john.doe@example.com',
        name: 'John Roe',
        password: 'foobar12'
    end

    before { user.save }
    it { should be_invalid }
  end

  context 'without e-mail' do
    before { user.email = nil }
    it { should be_invalid }
  end

  context 'without name' do
    before { user.name = nil }
    it { should be_invalid }
  end

  context 'without password' do
    before { user.password = nil }
    it { should be_invalid }
  end
end
