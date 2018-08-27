module Aucklandia
  module Routes
    ROUTE_ENDPOINT = '/gtfs/routes'

    def get_routes
      url = [BASE_URL, ROUTE_ENDPOINT].join('')

      response = RestClient::Request.execute(method: :get,
                                             url: url,
                                             headers: headers)
                                    .body

      JSON.parse(response)['response']
    end
  end
end