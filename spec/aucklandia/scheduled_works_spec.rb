require 'spec_helper'

RSpec.describe Aucklandia::ScheduledWorks do
  let(:client) { initialize_client }

  describe '#get_scheduled_works' do
    context 'successful response' do
      it 'responds with a collection of scheduled works', vcr: true do
        response = client.get_scheduled_works

        expect(response).to_not be_empty

        attributes = ['id', 'code', 'type', 'name', 'address', 'suburb',
                      'region', 'description', 'startDate', 'endDate', 'lastUpdated',
                      'contractorCompany', 'latitude', 'longitude', 'geometry']
        response.each do |scheduled_work|
          expect(scheduled_work).to include *attributes
        end
      end
    end
  end

end