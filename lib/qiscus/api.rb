require 'httparty'
require 'qiscus/client'

module Qiscus
  class Api
    include HTTParty

    Qiscus::Client::POST_METHODS.each do |method|
      define_singleton_method(method) do |data|
        res = self.post(
          "#{self.end_point}/#{method}",
          headers: self.headers,
          body: data.to_json
        ).to_json
        JSON.parse(res, symbolize_names: true)
      end
    end

    Qiscus::Client::GET_METHODS.each do |method|
      define_singleton_method(method) do |query|
        res = self.get(
          "#{self.end_point}/#{method}",
          headers: self.headers,
          query: query
        ).to_json
        JSON.parse(res, symbolize_names: true)
      end
    end

    def self.dummy
      # For testing purpose
      query = { room_id: 1375619, page: 1, limit: 10 }
      puts self.get(
        "#{self.end_point}/get_room_participants",
        headers: self.headers,
        query: query
      )
    end

    private
      def self.headers
        {
          "QISCUS_SDK_SECRET": "#{Qiscus.sdk_secret || '2820ae9dfc5362f7f3a10381fb89afc7'}",
          "Content-Type": "application/json"
        }
      end

      def self.end_point
        "https://#{Qiscus.end_point || 'sdksample.qiscus.com'}/api/#{Qiscus.api_version || 'v2.1'}/rest"
      end
  end
end
