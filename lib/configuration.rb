module Qiscus
  class Configuration
    def config
      yield self
    end
  end
end
