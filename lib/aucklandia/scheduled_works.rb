module Aucklandia
  module ScheduledWorks
    SCHEDULED_WORKS_ENDPOINT = '/locations/scheduledWorks'

    def get_scheduled_works
      url = build_url(BASE_URL, SCHEDULED_WORKS_ENDPOINT)

      response = get(url)

      JSON.parse(response)['response']
    end
  end
end