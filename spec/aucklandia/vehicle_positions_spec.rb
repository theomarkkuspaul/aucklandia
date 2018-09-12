require 'spec_helper'

RSpec.describe Aucklandia::VehiclePositions do
  let(:client) { Aucklandia::Client.new(ENV['AUCKLANDIA_SECRET']) }

	describe '#get_vehicle_positions' do
		context 'with no provided parameters' do
			context 'active vehicles' do
				it 'responds with a collection of all live vehicle positions', vcr: true do
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

	describe '#get_vehicle_positions_by_route_id' do

		context 'with active route id' do
			it 'responds with a collection of vehicle positions', vcr: true do
				route_id = '10502-20180815114333_v70.9'

				expect(client.get_vehicle_positions_by_route_id(route_id)).to_not be_empty
				client.get_vehicle_positions_by_route_id(route_id).each do |vehicle_position|
					expect(vehicle_position).to have_key 'vehicle'
		      expect(vehicle_position['vehicle']['trip']['route_id']).to eql route_id
				end
			end
		end

		context 'with route id that does not exist' do
			it 'responds with an empty collection', vcr: true do
				route_id = 'abc123'

				expect(client.get_vehicle_positions_by_route_id(route_id)).to be_empty
			end
		end

		context 'without parameters' do
			it 'raises an argument error', vcr: true do
				expect {
					client.get_vehicle_positions_by_route_id
				}.to raise_error ArgumentError
			end
		end

	end
end