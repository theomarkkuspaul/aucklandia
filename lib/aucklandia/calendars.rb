module Aucklandia
	module Calendars
		CALENDARS_ENDPOINT = '/gtfs/calendar'

		def get_calendars
			url = build_url(BASE_URL, CALENDARS_ENDPOINT)

			response = get(url)

			JSON.parse(response)['response']
		end

	end
end