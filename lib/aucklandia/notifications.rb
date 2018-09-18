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
  end
end