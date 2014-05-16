require 'rspec'
require 'fileutils'

$: << File.dirname(__FILE__) + "../lib"

def fixture_file(file)
  File.open(File.dirname(__FILE__) + "/fixtures/" + file)
end

