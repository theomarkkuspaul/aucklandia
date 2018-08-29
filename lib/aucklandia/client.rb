module Aucklandia
  class Client
    include Aucklandia::Routes
    include Aucklandia::Trips
    include Aucklandia::VehiclePositions

    attr_reader :authorization_key
    def initialize(authorization_key)
      @authorization_key = authorization_key
    end

    def headers
      {
        "Ocp-Apim-Subscription-Key" => @authorization_key
      }
    end
  end
end
