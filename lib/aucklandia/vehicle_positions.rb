module Aucklandia
	module VehiclePositions
    VEHICLE_POSITIONS_ENDPOINT = '/public/realtime/vehiclelocations'

    def get_vehicle_positions(trip_id=nil)
      url = [BASE_URL, VEHICLE_POSITIONS_ENDPOINT].join('')

      url << "?trip_id=#{trip_id}" if trip_id

      response = RestClient::Request.execute(method: :get,
                                             url: url,
                                             headers: headers)
                                    .body

      JSON.parse(response)['response']['entity']
    end
	end
end