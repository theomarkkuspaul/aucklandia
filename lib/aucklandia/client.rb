module Aucklandia
  class Client
    BASE_URL = "https://api.at.govt.nz/v2"

    attr_reader :authorization_key
    def initialize(authorization_key)
      @authorization_key = authorization_key
    end
  end
end
