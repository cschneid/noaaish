require "zlib"

# Inflates a given gziped file input to an output.
# input: File object
# output: File object

module Noaaish
  class Gunzip
    def initialize(input, output=destination)
      @input = input
      @destination = output
    end

    attr_reader :input

    def call
      zi = Zlib::Inflate.new(Zlib::MAX_WBITS + 32)
      destination << zi.inflate(input.read)
      destination
    end

    def destination
      @destination ||= Tempfile.new('noaaish-gunzip')
    end
  end
end
