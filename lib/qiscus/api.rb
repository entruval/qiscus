require 'httparty'
require 'json'
require 'qiscus/client'

module Qiscus
  class Api
    include HTTParty

    Qiscus::Client::POST_METHODS.each do |method|
      define_singleton_method(method) do |data|
        res = self.post(
          "#{self.end_point}/#{method}",
          headers: self.headers,
          body: self.clean_up(data).to_json
        ).to_json
        JSON.parse(res, symbolize_names: true)
      end
    end

    Qiscus::Client::GET_METHODS.each do |method|
      define_singleton_method(method) do |query|
        res = self.get(
          "#{self.end_point}/#{method}",
          headers: self.headers,
          query: self.clean_up(query)
        ).to_json
        JSON.parse(res, symbolize_names: true)
      end
    end

    Qiscus::Client::DELETE_METHODS.each do |method|
      define_singleton_method(method) do |data|
        res = self.delete(
          "#{self.end_point}/#{method}",
          headers: self.headers,
          body: self.clean_up(data).to_json
        ).to_json
        JSON.parse(res, symbolize_names: true)
      end
    end

    private
      def self.headers
        {
          "QISCUS_SDK_SECRET": "#{Qiscus.sdk_secret || '2820ae9dfc5362f7f3a10381fb89afc7'}",
          "QISCUS-SDK-APP-ID": "#{Qiscus.sdk_app_id || 'sdksample'}",
          "Content-Type": "application/json"
        }
      end

      def self.end_point
        "https://#{Qiscus.end_point || 'api.qiscus.com'}/api/#{Qiscus.api_version || 'v2.1'}/rest"
      end

      def self.clean_up(params)
        user_id = params[:user_id]
        room_id = params[:room_id]
        new_params = params.dup
        if !(user_id.nil?) && user_id.is_a?(Numeric)
          new_params = new_params.merge(user_id: user_id.to_s)
        end
        if !(room_id.nil?) && room_id.is_a?(Numeric)
          new_params = new_params.merge(room_id: room_id.to_s)
        end
        new_params
      end
  end
end
