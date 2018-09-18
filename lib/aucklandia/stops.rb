module Aucklandia
  module Stops
    STOPS_ENDPOINT = '/gtfs/stops'

    def get_stops_by_trip_id(trip_id)
      url = build_url(BASE_URL, STOPS_ENDPOINT, '/tripId/', trip_id)

      response = get(url)

      JSON.parse(response)['response']
    end

  end
end