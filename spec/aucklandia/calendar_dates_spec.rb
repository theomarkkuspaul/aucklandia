require 'spec_helper'

RSpec.describe Aucklandia::CalendarDates do
  let(:client) { initialize_client }

  describe '#get_calendar_dates' do
    context 'successful response' do
      it 'responds with a collection of calendar dates', vcr: true do
        response = client.get_calendar_dates

        expect(response).to_not be_empty
        response.each do |date|
          expect(date).to include 'service_id', 'date', 'exception_type'
        end
      end
    end
  end

end