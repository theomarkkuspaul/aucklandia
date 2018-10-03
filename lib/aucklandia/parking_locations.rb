module Aucklandia
	module ParkingLocations
		PARKING_LOCATIONS_ENDPOINT = '/locations/parkinglocations'

		def get_parking_locations
      url = build_url(BASE_URL, PARKING_LOCATIONS_ENDPOINT)

      response = get(url)

      JSON.parse(response)['response']
		end
	end
end