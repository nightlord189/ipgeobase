# frozen_string_literal: true

require "test_helper"
require "minitest/autorun"
require "webmock/minitest"
require_relative "../lib/ipgeobase"

class TestIpgeobase < Minitest::Test
  EXAMPLE_JSON = '{"status":"success","country":"United States","countryCode":"US","region":"VA",
"regionName":"Virginia","city":"Ashburn","zip":"20149","lat":39.03,"lon":-77.5,
"timezone":"America/New_York","isp":"Google LLC",
"org":"Google Public DNS","as":"AS15169 Google LLC","query":"8.8.8.8"}'

  def test_lookup
    stub_request(:get,
                 "http://ip-api.com/json/8.8.8.8").to_return(body: EXAMPLE_JSON)

    resp = Ipgeobase.lookup("8.8.8.8")
    assert !resp.nil?
    assert_equal "Ashburn", resp.city
    assert_equal "United States", resp.country
    assert_equal "US", resp.country_code
    assert_equal 39.03, resp.lat
    assert_equal(-77.5, resp.lon)
  end
end
