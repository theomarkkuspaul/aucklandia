
module Aucklandia
	module StopTimes
		STOP_TIMES_ENDPOINT = '/gtfs/stopTimes'

		def get_stop_times_by_stop_id(stop_id)
			url = build_url(BASE_URL, STOP_TIMES_ENDPOINT, '/stopId/', stop_id)

			response = get(url)

			JSON.parse(response)['response']
		end
	end
end