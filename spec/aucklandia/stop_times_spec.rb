require 'spec_helper'

RSpec.describe Aucklandia::StopTimes do
  let(:client) { Aucklandia::Client.new(ENV['AUCKLANDIA_SECRET']) }

  describe '#get_stop_times_by_stop_id' do

  	context 'with stop id parameter' do
  		context 'with valid stop id' do
  			let(:stop_id) { '0097-20180815114333_v70.9' }

  			it 'responds with a collection of stop times', vcr: true do
  				response = client.get_stop_times_by_stop_id(stop_id)

  				expect(response).not_to be_empty

  				response.each do |stop_time|
  					expect(stop_time).to have_key 'trip_id'
  					expect(stop_time).to have_key 'arrival_time'
  					expect(stop_time).to have_key 'departure_time'
  					expect(stop_time['stop_id']).to eql stop_id
  				end
  			end
  		end

  		context 'with invalid stop id' do
  			let(:stop_id) { 'idontknowwhattoputhere' }
  			it 'responds with an empty collection', vcr: true do
  				response = client.get_stop_times_by_stop_id(stop_id)

  				expect(response).to be_empty
  			end
  		end
  	end

  	context 'without stop id parameter' do
  		it 'raises an argument error' do 
  			expect {
  				client.get_stop_times_by_stop_id
  			}.to raise_error ArgumentError
  		end
  	end

  end

end