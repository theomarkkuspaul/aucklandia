
module Aucklandia
  module Shapes
    SHAPES_ENDPOINT = '/gtfs/shapes/tripId/'

    def get_shapes_by_trip(trip_id)
      url = build_url(BASE_URL, SHAPES_ENDPOINT, trip_id)

      response = get(url)

      JSON.parse(response)['response']
    end
  end
end