require 'spec_helper'

RSpec.describe Aucklandia::Shapes do
  let(:client) { Aucklandia::Client.new(ENV['AUCKLANDIA_SECRET']) }

  describe '#get_shapes_by_trip' do
    context 'with trip ID' do
      it 'responds with a collection of shape points', vcr: true do
        trip_id = '476140492-20180815114333_v70.9'

        client.get_shapes_by_trip(trip_id).each do |shape_point|
          expect(shape_point).to have_key 'shape_id'
          expect(shape_point).to have_key 'shape_pt_lat'
          expect(shape_point).to have_key 'shape_pt_lon'
          expect(shape_point).to have_key 'shape_pt_sequence'
        end
      end
    end

    context 'without trip id parameter' do
      it 'raises an argument error', vcr: true do
        expect {
          client.get_shapes_by_trip
        }.to raise_error ArgumentError
      end
    end
  end
end