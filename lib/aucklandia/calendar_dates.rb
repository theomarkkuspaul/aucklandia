module Aucklandia
  module CalendarDates
    CALENDAR_DATES_ENDPOINT = '/gtfs/calendarDate'

    def get_calendar_dates
      url = build_url(BASE_URL, CALENDAR_DATES_ENDPOINT)

      response = get(url)

      JSON.parse(response)['response']
    end

  end
end