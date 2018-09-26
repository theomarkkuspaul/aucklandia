module Aucklandia
  module Notifications
    NOTIFICATIONS_ENDPOINT = '/notifications'

    def get_notifications
      url = build_url(BASE_URL, NOTIFICATIONS_ENDPOINT)

      response = get(url)

      JSON.parse(response)['response']
    end

    def get_notifications_by_category(category)
    	url = build_url(BASE_URL, NOTIFICATIONS_ENDPOINT, '/', category)

    	response = get(url)

    	JSON.parse(response)['response']
    end

    def get_notifications_by_stop_id(stop_id)
      url = build_url(BASE_URL, NOTIFICATIONS_ENDPOINT, '/stop/', stop_id)

      response = get(url)

      data = JSON.parse(response)

      data.has_key?('response') ? data['response'] : []
    end
  end
end