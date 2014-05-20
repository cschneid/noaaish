require 'pathname'
require 'tempfile'

# Takes the terrible ISH data format and converts it into something "reasonable".
module Noaaish
  class Translator
    # Tail is to not print first line, which is header info
    ISH_JAVA_COMMAND = 'java -cp %<exe_path>s ishJava < %<input>s | tail -n+2 > %<output>s'.freeze

    def initialize(input, output=destination)
      @input = input
      @destination = output
    end

    attr_reader :input

    def call
      system(java_command)
      destination
    end

    def destination
      @destination ||= Tempfile.new('noaaish-translator')
    end

    def java_command
      sprintf ISH_JAVA_COMMAND, exe_path: ish_java_path, input: input.path, output: destination.path
    end

    def ish_java_path
      Pathname.new(File.dirname(__FILE__)).
        parent.  # lib/
        parent + # /
        "java"
    end
  end
end
