require 'json'
require 'tempfile'

module Noaaish
  class Extractor
    def initialize(input, output=destination, format=:hash)
      @input = input
      @destination = output
      @format = format
    end

    attr_reader :input, :format

    def call
      # For each line, create a json record.
      hash = input.each_line.map { |line|
        NOAA_FIELDS.inject({}) do |hash, (field, range)|
          hash.merge(field => line[range])
        end
      }

      case format
      when :json
        destination << hash.to_json
        destination
      when :hash
        hash
      end
    end

    def destination
      @destination ||= Tempfile.new('noaaish-translator')
    end

    NOAA_FIELDS = {'HR_TIME' => (13...23), # YYYYMMDDHH
                   'HR'      => (21...23),
                   'MN'      => (23...25),
                   'DIR'     => (26...29),
                   'SPD'     => (30...33),
                   'GUS'     => (34...37),
                   'CLG'     => (38...41),
                   'SKC'     => (42...45),
                   'L'       => (46...47),
                   'M'       => (48...49),
                   'H'       => (50...51),
                   'VSB'     => (52...56),
                   'MW1'     => (57...59),
                   'MW2'     => (60...62),
                   'MW3'     => (63...65),
                   'MW4'     => (66...68),
                   'AW1'     => (69...71),
                   'AW2'     => (72...74),
                   'AW3'     => (75...77),
                   'AW4'     => (78...80),
                   'W'       => (81...82),
                   'TEMP'    => (83...87),
                   'DEWP'    => (88...92),
                   'SLP'     => (93...99),
                   'ALT'     => (100...105),
                   'STP'     => (106...112),
                   'MAX'     => (113...116),
                   'MIN'     => (117...120),
                   'PCP01'   => (121...126),
                   'PCP06'   => (127...132),
                   'PCP24'   => (133...138),
                   'PCPXX'   => (139...144),
                   'SD'      => (145...147),}

  end
end
