module Aucklandia
  class Client
    attr_reader :authorization_key
    def initialize(authorization_key)
      @authorization_key = authorization_key
    end
  end
end
