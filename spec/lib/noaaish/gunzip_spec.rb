require 'spec_helper'
require 'noaaish/gunzip'

module Noaaish
  describe Gunzip do
    let(:input) { fixture_file("943900-99999-2014.gz")}
    let(:expected_output) { fixture_file("943900-99999-2014")}

    subject { described_class.new(input) }

    describe "#destination" do
      context "with no explicit destination" do
        subject { described_class.new(input) }

        it { expect(subject.destination).to be_a(Tempfile) }
      end

      context "with an explicit output file" do
        let(:output) { Tempfile.new('test-file') }
        subject { described_class.new(input, output) }

        it { expect(subject.destination).to eq(output) }
      end
    end

    it "inflates input file into destination file" do
      subject.call
      expect(FileUtils.compare_file(expected_output.path, subject.destination)).to eq(true)
    end
  end
end
