require 'spec_helper'

RSpec.describe Aucklandia::Routes do
  let(:client) { Aucklandia::Client.new(ENV['AUCKLANDIA_SECRET']) }

  describe '#get_routes' do
    context 'successful response' do
      it 'returns a collection of bus routes', vcr: true do
        expect(client.get_routes).to be_a Array
      end
    end
  end

  describe '#get_routes_by_short_name' do
    let(:short_name) { 'OUT' }

    context 'available short name' do
      it 'responds with routes matching short name', vcr: true do
        client.get_routes_by_short_name(short_name).each do |route|
          expect(route['route_short_name']).to eq short_name
        end
      end
    end

    context 'short name does not match any routes' do
      let(:short_name) { 'blahblahblah' }

      it 'responds with an empty collection of routes', vcr: true do
        expect(client.get_routes_by_short_name(short_name)).to be_empty
      end
    end
  end

  describe '#get_route_by_id' do
    context 'route id exists' do
      let(:id) { '73902-20181026152814_v71.31' } # route_short_name: 739

      it 'responds with the route', vcr: true do
        response = client.get_route_by_id(id)

        expect(response['route_id']).to eq id
      end
    end

    context 'route id does not exist' do
      let(:id) { 'wutangagain?' }

      it 'responds with nothing', vcr: true do
        response = client.get_route_by_id(id)

        expect(response).to be_nil
      end
    end
  end
end