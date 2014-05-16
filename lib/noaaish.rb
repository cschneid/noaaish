require "noaaish/version"
require "noaaish/fetch"
require "noaaish/gunzip"
require "noaaish/translator"
require "noaaish/extractor"

# Returns a list of 
module Noaaish
  def self.data_for(station_id, years, final_output=StringIO.new)
    station_id = station_id
    years = Array(years)

    years.map do |year|
      f = Fetch.new(station_id, year);                 f.call
      g = Gunzip.new(f.destination);                   g.call
      j = Translator.new(g.destination);               j.call
      e = Extractor.new(j.destination, final_output);  e.call

      e.destination
    end
  end
end

