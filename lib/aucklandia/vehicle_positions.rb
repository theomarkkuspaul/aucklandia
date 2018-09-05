module Aucklandia
	module VehiclePositions
    VEHICLE_POSITIONS_ENDPOINT = '/public/realtime/vehiclelocations'

    def get_vehicle_positions(trip_id=nil)
      params = { tripid: trip_id } if trip_id

      url = build_url(BASE_URL, VEHICLE_POSITIONS_ENDPOINT, params: params)

      response = get(url)

      JSON.parse(response)['response']['entity']
    end

    def get_vehicle_positions_by_route_id(route_id)
      get_vehicle_positions.select do |vehicle_position|
        vehicle_position if vehicle_position['vehicle']['trip']['route_id'] == route_id
      end
    end
	end
end