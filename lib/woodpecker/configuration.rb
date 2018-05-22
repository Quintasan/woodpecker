# frozen_string_literal: true

module Woodpecker
  class Configuration
    # Woodpecker API uses HTTP Basic Authentication where the token is the
    # username and password can be anything. Weird.
    attr_writer :api_key, :dummy_password

    def initialize
      @api_key = nil
      @dummy_password = nil
    end

    def api_key
      raise Errors::Configuration, 'Woodpecker API key missing!' unless @api_key
      @api_key
    end

    def dummy_password
      @dummy_password ||= "X"
    end
  end
end
