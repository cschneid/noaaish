require "noaaish/version"
require "noaaish/fetch"
require "noaaish/gunzip"
require "noaaish/translator"
require "noaaish/extractor"

module Noaaish
  def self.data_for(station_id, years)
    station_id = station_id
    years = Array(years)

    years.map { |year| Fetch.new(station_id, year).call }
         .map { |io|   Gunzip.new(io).call              }
         .map { |io|   Translator.new(io).call          }
         .map { |io|   Extractor.new(io).call           }
  end
end

