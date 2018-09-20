require 'spec_helper'

RSpec.describe Aucklandia::StopTimes do
  let(:client) { initialize_client }

  describe '#get_stop_times_by_trip_id' do
    context 'with valid trip id parameter' do
      let(:trip_id) { '469145964-20180910122836_v70.22' }

      before do
        @response = client.get_stop_times_by_trip_id trip_id
      end

      it 'responds with a collection of stop times', vcr: true do
        expect(@response).to_not be_empty

        @response.each do |stop_time|
          expect(stop_time).to include 'trip_id', 'arrival_time', 'departure_time', 'stop_id',
                                       'stop_sequence', 'arrival_time_seconds', 'departure_time_seconds'
        end

      end

      it 'orders the stop times in incremental order by stop sequence', vcr: true do
        @response.each_with_index do |stop_time, index|
          break if index === @response.length - 1

          next_stop_sequence_num = stop_time['stop_sequence'] + 1
          next_stop_time = @response[index + 1]

          expect(next_stop_sequence_num).to eql next_stop_time['stop_sequence']
        end
      end
    end

    context 'with invalid trip id parameter' do
      let(:trip_id) { 'blahblahblah' }

      it 'responds with an empty collection of stop times', vcr: true do
        response = client.get_stop_times_by_trip_id trip_id

        expect(response).to be_empty
      end

    end

    context 'without trip id parameter' do

      it 'raises an argument error' do
        expect {
          client.get_stop_times_by_trip_id
        }.to raise_error ArgumentError
      end

    end
  end

end