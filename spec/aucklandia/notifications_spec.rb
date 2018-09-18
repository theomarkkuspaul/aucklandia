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

  describe '#get_notifications_by_category' do
    let(:category) { 'MOVED_STOP' }

    context 'successful response' do
      it 'responds with a timestamp of the request', vcr: true do
        response = client.get_notifications_by_category category

        expect(response).to have_key 'time'
      end

      context 'with valid param' do
        it 'responds with a data payload', vcr: true do
          response = client.get_notifications_by_category category

          expect(response).to have_key 'data'
          expect(response['data']).to_not be_empty
          response['data'].each do |notification|
            expect(notification).to include 'id', 'orderingDate', 'type', 'description'
          end
        end

        
      end

      context 'with invalid param' do
        let(:category) { 'nothingmuchgoingonhere' }

        it 'responds with an empty data payload', vcr: true do
          response = client.get_notifications_by_category category

          expect(response).to have_key 'data'
          expect(response['data']).to be_empty
        end
      end
    end

    context 'without category parameter' do
      it 'raises an argument error', vcr: true do
        expect {
          client.get_notifications_by_category
        }.to raise_error ArgumentError
      end
    end
  end

  describe '#get_notifications_by_stop_id' do
    context 'successful response' do
      context 'with valid param' do
        let(:stop_id) { 7035 }

        it 'responds with a collection of stop notifications', vcr: true do
          response = client.get_notifications_by_stop_id stop_id
          attributes = ['OBJECTID', 'AFFECTEDSTOPID', 'AFFECTEDROUTE',
                        'NEWSTOPID', 'NEWSTOPNAME', 'NEWSTOPSTATUS', 'NEWSTOPNOTE']

          expect(response).to_not be_empty
          response.each do |stop_notification|
            expect(stop_notification['attributes']).to include *attributes
          end
        end
      end

      context 'with invalid param' do
        let(:stop_id) { 'thisisnothestopyouarelookingfor' }

        it 'responds with an empty collection', vcr: true do
          response = client.get_notifications_by_stop_id stop_id

          expect(response).to be_empty
        end
      end
    end

    context 'without category parameter' do
      it 'raises an argument error', vcr: true do
        expect {
          client.get_notifications_by_stop_id
        }.to raise_error ArgumentError
      end
    end
  end
end