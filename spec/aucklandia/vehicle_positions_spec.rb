require 'spec_helper'

RSpec.describe Aucklandia::VehiclePositions do
  let(:client) { Aucklandia::Client.new('password123') }

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
				it 'responds with a collection of vehicle positions' do
					payload = File.read('spec/fixtures/get-vehicle-positions-with-trip-id-successful.json')
					successful_payload = instance_double('RestClient::Response', body: payload)

	        allow(RestClient::Request).to receive(:execute)
	                                  .and_return(successful_payload)

	        trip_id =  JSON.parse(payload)['response']['entity'].first['vehicle']['trip']['trip_id']

	        client.get_vehicle_positions(trip_id).each do |vehicle_position|
		        expect(vehicle_position).to have_key 'vehicle'
		        expect(vehicle_position['vehicle']['trip']['trip_id']).to eql trip_id
	        end
				end
			end
		end
	end
end