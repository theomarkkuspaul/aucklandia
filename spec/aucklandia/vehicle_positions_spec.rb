require 'spec_helper'

RSpec.describe Aucklandia::VehiclePositions do
  let(:client) { Aucklandia::Client.new(ENV['AUCKLANDIA_SECRET']) }

	describe '#get_vehicle_positions' do
		context 'with no provided parameters' do
			context 'active vehicles' do
				it 'responds with a collection of all live vehicle positions' do
					payload = File.read('spec/fixtures/get-vehicle-positions-successful.json')
	        successful_payload = instance_double('RestClient::Response', body: payload)

	        allow(RestClient::Request).to receive(:execute)
	                                  .and_return(successful_payload)

					expect(client.get_vehicle_positions).to_not be_empty
					client.get_vehicle_positions.each do |vehicle_position|
						expect(vehicle_position).to have_key 'vehicle'
					end
				end
			end

			context 'with trip_id parameter' do
				it 'responds with a collection of vehicle positions', vcr: true do
	        trip_id = '476143384-20180815114333_v70.9'

	        client.get_vehicle_positions(trip_id).each do |vehicle_position|
		        expect(vehicle_position).to have_key 'vehicle'
		        expect(vehicle_position['vehicle']['trip']['trip_id']).to eql trip_id
	        end
				end
			end
		end
	end
end