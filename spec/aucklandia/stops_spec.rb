require 'spec_helper'

RSpec.describe Aucklandia::Stops do
  let(:client) { Aucklandia::Client.new(ENV['AUCKLANDIA_SECRET']) }

  describe '#get_stops' do
    context 'successful response' do
      it 'responds with a collection of stops', vcr: true do
        response = client.get_stops

        expect(response).to be_an Array
        response.each do |stop|
          expect(stop).to have_key 'stop_id'
          expect(stop).to have_key 'stop_name'
          expect(stop).to have_key 'stop_lat'
          expect(stop).to have_key 'stop_lon'
          expect(stop).to have_key 'stop_code'
        end
      end
    end
  end

  describe '#get_stops_by_trip_id' do
    context 'with trip id parameter' do
      let(:trip_id) { '476136543-20180815114333_v70.9' }
      context 'valid trip id' do
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

      context 'invalid trip id' do
        let(:trip_id) { 'delicious' }
        it 'responds with an empty collection', vcr: true do
          response = client.get_stops_by_trip_id(trip_id)

          expect(response).to be_an Array
          expect(response).to be_empty
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