require 'spec_helper'

RSpec.describe Aucklandia::Trips do
  let(:client) { Aucklandia::Client.new('password123') }

  describe '#get_trips_by_route' do
    context 'when route exists' do
      it 'responds with a collection of trips' do
        payload = File.read('spec/fixtures/get-trips-by-route-successful.json')
        successful_payload = instance_double('RestClient::Response', body: payload)

        allow(RestClient::Request).to receive(:execute)
                                  .and_return(successful_payload)

        route_id = JSON.parse(successful_payload.body)['response'].first['route_id']

        expect(client.get_trips_by_route(route_id)).to_not be_empty

        client
        .get_trips_by_route(route_id)
        .each { |trip| expect(trip['route_id']).to eq route_id }
      end
    end

    context 'when route does not exist' do
        it 'responds with an empty collection of trips' do
          payload = File.read('spec/fixtures/get-trips-by-route-unsuccessful.json')
          unsuccessful_payload = instance_double('RestClient::Response', body: payload)

          allow(RestClient::Request).to receive(:execute)
                                    .and_return(unsuccessful_payload)

          route_id = 'somethingverymisguided'

          expect(client.get_trips_by_route(route_id)).to be_empty
      end
    end
  end
end