module Aucklandia
	module VehiclePositions
    VEHICLE_POSITIONS_ENDPOINT = '/public/realtime/vehiclelocations'

    def get_vehicle_positions(trip_id=nil)
      params = { tripid: trip_id } if trip_id

      url = build_url(BASE_URL, VEHICLE_POSITIONS_ENDPOINT, params: params)

      response = get(url)

      JSON.parse(response)['response']['entity']
    end
	end
end