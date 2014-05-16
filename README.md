# Noaaish

Fetches historical weather data from NOAA's FTP server

Heavily influenced by https://github.com/stewartwatts/noaahist - but nowhere as cool yet.

No auto-finding of station ids yet

## Installation

Add this line to your application's Gemfile:

    gem 'noaaish'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install noaaish

## Usage

```
station_id = "720538-99999"
results = Noaaish.data_for(station_id, [2013, 2014])
# result[0] = a Tempfile holding a JSON representation of all 2013 data
# result[1] = a Tempfile holding a JSON representation of all 2014 data
``

## Contributing

1. Fork it ( http://github.com/cschneid/noaaish/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
