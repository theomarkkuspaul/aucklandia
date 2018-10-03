module Aucklandia
	module VehiclePositions
    VEHICLE_POSITIONS_ENDPOINT = '/public/realtime/vehiclelocations'

    def get_vehicle_positions(trip_id: nil, vehicle_id: nil)
      params = { tripid: trip_id, vehicleid: vehicle_id }.delete_if { |k,v| v.nil? }

      url = build_url(BASE_URL, VEHICLE_POSITIONS_ENDPOINT, params: params)

      response = get(url)

      JSON.parse(response)['response']['entity']
    end


    def get_vehicle_position_by_vehicle_id(vehicle_id)
      get_vehicle_positions(vehicle_id: vehicle_id).first
    end

    def get_vehicle_positions_by_route_id(route_id)
      get_vehicle_positions.select do |vehicle_position|
        vehicle_position if vehicle_position['vehicle']['trip']['route_id'] == route_id
      end
    end
	end
end