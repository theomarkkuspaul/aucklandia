require 'spec_helper'

RSpec.describe Aucklandia::Versions do
  let(:client) { Aucklandia::Client.new(ENV['AUCKLANDIA_SECRET']) }
  describe '#get_versions' do
    it 'responds with a collection of versions', vcr: true do
      client.get_versions.each do |version|
        expect(version).to have_key 'version'
        expect(version).to have_key 'startdate'
        expect(version).to have_key 'enddate'
      end
    end
  end

end