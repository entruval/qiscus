require 'httparty'

module Qiscus
  class Kentang
    def self.goreng
      HTTParty.get('https://www.google.com')
      puts "Kentang Goreng enak"
      puts ENV
      puts Qiscus::Configuration.config
    end
  end
end
