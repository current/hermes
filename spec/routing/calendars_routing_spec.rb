require 'rails_helper'

describe CalendarsController do
  describe 'routing' do

    it 'routes to #show' do
      expect(:get => '/calendar').to route_to('calendars#show')
    end

    it 'routes to #show' do
      expect(:get => '/calendar/1982/02/02').to route_to('calendars#show', year: '1982', month: '02', day: '02')
    end

  end
end
