require 'tempfile'

# Class responsible for fetching a specific station's data from the server for
# a given year. No attempt to pre or post process the data is made.

module Noaaish
  class Fetch
    URL_TEMPLATE = 'ftp://ftp.ncdc.noaa.gov/pub/data/noaa/%<year>s/%<station_id>s-%<year>s.gz'.freeze
    CURL_TEMPLATE = 'curl -o %<destination>s %<url>s'

    def initialize(station_id, year)
      @station_id = station_id
      @year = year
    end

    def call
      result = system(curl_command)
      raise "Failed calling #{curl_command}" unless result
      destination
    end

    attr_reader :station_id, :year

    def destination
      @destination ||= Tempfile.new("noaaish-fetch-#{station_id}")
    end

    def ftp_path
      sprintf URL_TEMPLATE, :station_id => station_id, :year => year
    end

    def curl_command
      sprintf CURL_TEMPLATE, :url => ftp_path, :destination => destination.path
    end
  end
end
