# frozen_string_literal: true

module Woodpecker
  module Utils
    module Request
      module_function

      def get(endpoint, params = {})
        request = Typhoeus::Request.get("https://api.woodpecker.co/rest/v1/#{endpoint}",
                                        userpwd: "#{Woodpecker.configuration.api_key}:#{Woodpecker.configuration.dummy_password}",
                                        params: params)
        data = JSON.parse(request.response_body, symbolize_names: true)
        data
      end

      def post(endpoint, params = {}, body = {})
        request = Typhoeus::Request.post("https://api.woodpecker.co/rest/v1/#{endpoint}",
                                         userpwd: "#{Woodpecker.configuration.api_key}:#{Woodpecker.configuration.dummy_password}",
                                         params: params,
                                         body: body)
        data = JSON.parse(request.response_body, symbolize_names: true)
        data
      end
    end
  end
end
