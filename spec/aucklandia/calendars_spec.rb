require 'spec_helper'

RSpec.describe Aucklandia::Calendars do
	let(:client) { initialize_client }

	describe '#get_calendars' do
		context 'successful response' do

			it 'responds with a collection of calendars', vcr: true do
				response = client.get_calendars

				expect(response).to_not be_empty
				response.each do |calendar|
					expect(calendar).to include 'service_id', 'monday', 'tuesday',
																	'wednesday', 'thursday', 'friday', 
																	'saturday', 'sunday', 'start_date', 'end_date'
				end
			end

		end
	end

end