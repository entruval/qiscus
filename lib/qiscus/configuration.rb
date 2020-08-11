module Qiscus
  module Configuration
    CONFIG = [:end_point, :api_version, :sdk_secret]

    attr_accessor *CONFIG

    def config
      yield self
    end
  end
end
