require 'spec_helper'

RSpec.describe Aucklandia::Routes do
  let(:client) { Aucklandia::Client.new('password123') }

  describe '#get_routes' do
    context 'successful response' do
      it 'returns a collection of bus routes', vcr: true do
        successful_payload = instance_double('RestClient::Response', body: {
                              "status": "OK",
                              "response": [{
                                "route_id": "32602-20180815114333_v70.9",
                                "agency_id": "GBT",
                                "route_short_name": "326",
                                "route_long_name": "Otahuhu Station To Mangere Town Centre Via Tidal Road",
                                "route_desc": nil,
                                "route_type": 3,
                                "route_url": nil,
                                "route_color": nil,
                                "route_text_color": nil
                              }, {
                                "route_id": "17107-20180815114333_v70.9",
                                "agency_id": "RTH",
                                "route_short_name": "171X",
                                "route_long_name": "Laingholm To City Centre Express",
                                "route_desc": nil,
                                "route_type": 3,
                                "route_url": nil,
                                "route_color": nil,
                                "route_text_color": nil
                              }]
                            }.to_json)

        allow(RestClient::Request).to receive(:execute)
                                  .and_return(successful_payload)

        expect(client.get_routes).to be_a Array
        expect(client.get_routes.length).to be 2
      end
    end
  end
end