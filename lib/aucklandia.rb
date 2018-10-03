require "aucklandia/support/requestable"
require "aucklandia/version"

require "aucklandia/routes"
require "aucklandia/trips"
require "aucklandia/vehicle_positions"
require "aucklandia/versions"
require "aucklandia/stops"
require "aucklandia/stop_times"
require "aucklandia/shapes"
require "aucklandia/scheduled_works"
require "aucklandia/notifications"
require "aucklandia/parking_locations"
require "aucklandia/calendars"
require "aucklandia/calendar_dates"
require "aucklandia/client"

require 'rest-client'
require 'json'

module Aucklandia
  BASE_URL = "https://api.at.govt.nz/v2"
end
