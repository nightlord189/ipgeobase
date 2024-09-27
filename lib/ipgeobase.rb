# frozen_string_literal: true

require_relative "ipgeobase/version"
require "net/http"
require "uri"
require "json"

# Ipgeobase - main module to extract metadaya by IP
module Ipgeobase
  class Error < StandardError; end

  # Metadata - main class
  class Metadata
    attr_reader :city, :country, :country_code, :lat, :lon

    def initialize(city, country, country_code, lat, lon)
      @city = city
      @country = country
      @country_code = country_code
      @lat = lat
      @lon = lon
    end
  end

  def self.lookup(ip)
    url = URI.parse("http://ip-api.com/json/#{ip}")
    response = Net::HTTP.get_response(url)
    puts response.body
    data = JSON.parse(response.body)
    puts data
    Metadata.new(data["city"], data["country"], data["countryCode"], data["lat"], data["lon"])
  end
end
