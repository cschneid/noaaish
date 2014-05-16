# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'noaaish/version'

Gem::Specification.new do |spec|
  spec.name          = "noaaish"
  spec.version       = Noaaish::VERSION
  spec.authors       = ["Chris Schneider"]
  spec.email         = ["cschneider@comverge.com"]
  spec.summary       = %q{Fetch ISH data from NOAA}
  spec.description   = %q{Fetch ISH data from NOAA}
  spec.homepage      = "http://www.github.com/cschneid/noaaish"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"

  spec.add_development_dependency "rspec"
  spec.add_development_dependency "guard"
  spec.add_development_dependency "guard-rspec"
end
