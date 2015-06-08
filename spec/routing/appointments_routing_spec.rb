require 'rails_helper'

describe AppointmentsController do
  describe 'routing' do

    it 'routes to #new' do
      expect(:get => '/appointments/new').to route_to('appointments#new')
    end

    it 'routes to #show' do
      expect(:get => '/appointments/1').to route_to('appointments#show', :id => '1')
    end

    it 'routes to #edit' do
      expect(:get => '/appointments/1/edit').to route_to('appointments#edit', :id => '1')
    end

    it 'routes to #create' do
      expect(:post => '/appointments').to route_to('appointments#create')
    end

    it 'routes to #update' do
      expect(:put => '/appointments/1').to route_to('appointments#update', :id => '1')
    end

    it 'routes to #destroy' do
      expect(:delete => '/appointments/1').to route_to('appointments#destroy', :id => '1')
    end

  end
end
