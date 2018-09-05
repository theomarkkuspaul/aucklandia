module Aucklandia
  module Versions
    VERSIONS_ENDPOINT = '/gtfs/versions'
    # objects within the AT API
    # have identifiers that adhere to a versioning convention.
    # This API call returns the latest 'version'
    # of the most up-to-date data.
    def get_versions
      url = build_url(BASE_URL, VERSIONS_ENDPOINT)

      response = get(url)

      JSON.parse(response)['response']
    end

  end
end