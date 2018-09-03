module Aucklandia
  module Trips
    TRIPS_ENDPOINT = '/gtfs/trips'

    def get_trips_by_route(route_id)
      url = build_url(BASE_URL, TRIPS_ENDPOINT, '/routeid/', route_id)

      response = get(url)

      JSON.parse(response)['response']
    end
  end
end