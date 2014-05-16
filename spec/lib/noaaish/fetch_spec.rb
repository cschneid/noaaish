require 'spec_helper'
require 'noaaish/fetch'

module Noaaish
  describe Fetch do
    let(:station_id) { "11111-00000" }
    let(:year)       { 2014 }

    subject { described_class.new(station_id, year) }

    describe "#ftp_path" do
      it "generates the URL for the station" do
        expect(subject.ftp_path).to eq("ftp://ftp.ncdc.noaa.gov/pub/data/noaa/#{year}/#{station_id}-#{year}.gz")
      end
    end

    describe "#curl_command" do
      it "generates the curl command to run" do
        expect(subject.curl_command).to eq("curl -o #{subject.destination.path} #{subject.ftp_path}")
      end
    end

    describe "#destination" do
      it "creates a tempfile" do
        expect(subject.destination).to be_a(Tempfile)
      end

      it "caches the result" do
        expect(subject.destination.object_id).to eq(subject.destination.object_id)
      end
    end
  end
end
