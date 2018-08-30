require 'spec_helper'

RSpec.describe Aucklandia::Trips do
  let(:client) { Aucklandia::Client.new(ENV['AUCKLANDIA_SECRET']) }

  describe '#get_trips_by_route' do
    context 'when route exists' do
      it 'responds with a collection of trips', vcr: true do
        route_id = '73116-20180815114333_v70.9'

        expect(client.get_trips_by_route(route_id)).to_not be_empty

        client.get_trips_by_route(route_id).each do |route|
          expect(route['route_id']).to eql route_id
        end
      end
    end

    context 'when route does not exist' do
        it 'responds with an empty collection of trips', vcr: true do
          route_id = 'somethingverymisguided'

          expect(client.get_trips_by_route(route_id)).to be_empty
      end
    end
  end
end