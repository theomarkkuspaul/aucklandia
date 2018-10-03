require 'spec_helper'

RSpec.describe Aucklandia::ParkingLocations do
  let(:client) { initialize_client }

  describe '#get_parking_locations' do
    context 'successful response' do
      it 'responds with a collection of parking locations', vcr: true do

        response = client.get_parking_locations

        expect(response).to_not be_empty

        attributes = ['id', 'name', 'address', 'type', 'latitude', 'longitude', 'mobilitySpaces']
        response.each do |parking_spot|
          expect(parking_spot).to include *attributes
        end

      end
    end
  end

end