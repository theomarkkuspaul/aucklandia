
module Aucklandia
	module StopTimes
		STOP_TIMES_ENDPOINT = '/gtfs/stopTimes'

		def get_stop_times_by_trip_id(trip_id)
			url = build_url(BASE_URL, STOP_TIMES_ENDPOINT, '/tripId/', trip_id)

			response = get(url)

			JSON.parse(response)['response']
		end

	end
end