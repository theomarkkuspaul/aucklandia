require 'spec_helper'

RSpec.describe Aucklandia::Notifications do
  let(:client) { Aucklandia::Client.new(ENV['AUCKLANDIA_SECRET']) }

  describe '#get_notifications' do
    it 'responds with a data payload', vcr: true do
      response = client.get_notifications

      expect(response).to have_key 'data'
      expect(response['data']).to_not be_empty
      response['data'].each do |notification|
        expect(notification).to include 'id', 'orderingDate', 'type', 'description'
      end
    end

    it 'responds with a timestamp of the request', vcr: true do
      response = client.get_notifications

      expect(response).to have_key 'time'
    end
  end
end