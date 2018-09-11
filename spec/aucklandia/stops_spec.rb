require 'spec_helper'

RSpec.describe Aucklandia::Stops do
  let(:client) { Aucklandia::Client.new(ENV['AUCKLANDIA_SECRET']) }

	describe '#get_stops_by_trip_id' do
		let(:trip_id) { '476136543-20180815114333_v70.9' }
		context 'with trip id parameter' do
			it 'responds with a collection of stops', vcr: true do
				client.get_stops_by_trip_id(trip_id).each do |stop|
					expect(stop).to have_key 'stop_id'
					expect(stop).to have_key 'stop_name'
					expect(stop).to have_key 'stop_lat'
					expect(stop).to have_key 'stop_lon'
					expect(stop).to have_key 'stop_code'
				end
			end
		end

		context 'without any parameters' do
			it 'raises an argument error', vcr: true do
				expect {
					client.get_stops_by_trip_id
				}.to raise_error ArgumentError
			end
		end
	end

end