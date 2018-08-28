module Aucklandia
  module Trips
    TRIPS_ENDPOINT = '/gtfs/trips'

    def get_trips_by_route(route_id)
      url = [BASE_URL, TRIPS_ENDPOINT, '/routeid/', route_id].join('')

      response = RestClient::Request.execute(method: :get,
                                             url: url,
                                             headers: headers)
                                    .body

      JSON.parse(response)['response']
    end
  end
end