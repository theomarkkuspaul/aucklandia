require 'spec_helper'

RSpec.describe Aucklandia::Routes do
  let(:client) { Aucklandia::Client.new('password123') }

  describe '#get_routes' do
    context 'successful response' do
      it 'returns a collection of bus routes' do
        payload = File.read('spec/fixtures/get-routes.json')
        successful_payload = instance_double('RestClient::Response', body: payload)

        allow(RestClient::Request).to receive(:execute)
                                  .and_return(successful_payload)

        expect(client.get_routes).to be_a Array
        expect(client.get_routes.length).to be 2
      end
    end
  end

  describe '#get_routes_by_short_name' do
    let(:short_name) { 'OUT' }

    context 'available short name' do
      it 'responds with routes matching short name' do
        payload = File.read('spec/fixtures/get-routes-by-short-name-successful.json')
        successful_payload = instance_double('RestClient::Response', body: payload)

        allow(RestClient::Request).to receive(:execute)
                                  .and_return(successful_payload)

        client.get_routes_by_short_name(short_name).each do |route|
          expect(route['route_short_name']).to eq short_name
        end
      end
    end

    context 'short name does not match any routes' do
      let(:short_name) { 'blahblahblah' }

      it 'responds with an empty collection of routes' do
        payload = File.read('spec/fixtures/get-routes-by-short-name-unsuccessful.json')
        unsuccessful_payload = instance_double('RestClient::Response', body: payload)

        allow(RestClient::Request).to receive(:execute)
                                  .and_return(unsuccessful_payload)

        expect(client.get_routes_by_short_name(short_name)).to be_empty
      end
    end
  end
end