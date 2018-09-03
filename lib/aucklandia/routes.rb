module Aucklandia
  module Routes
    ROUTE_ENDPOINT = '/gtfs/routes'

    def get_routes
      url = build_url(BASE_URL, ROUTE_ENDPOINT)

      response = get(url)

      JSON.parse(response)['response']
    end

    def get_routes_by_short_name(short_name)
      url = build_url(BASE_URL, ROUTE_ENDPOINT, '/routeShortName/', short_name)

      response = get(url)

      JSON.parse(response)['response']
    end
  end
end