require 'spec_helper'

class DummyClass
  include Requestable
  def headers
    { 'Content-Type': 'abc123'}
  end
end

RSpec.describe Requestable do
  let(:dummy) { DummyClass.new }

  describe '#get' do
    context 'with no parameters' do
      it 'raises an argument error' do
        expect { dummy.get }.to raise_error ArgumentError
      end
    end

    context 'with a url parameter' do
      it 'returns a HTTP REST response', vcr: true do
        url = 'google.com'
        response = dummy.get(url)

        [:body, :headers, :code, :method].each do |attribute|
          expect(response).to respond_to attribute
        end
      end
    end
  end

  describe '#build_url' do
    let (:base_url) { 'http://test.com' }
    let (:slug) { '/testing' }
    context 'with 2 parameters' do
      it 'builds a url' do
        expect(dummy.build_url(base_url, slug)).to eql 'http://test.com/testing'
      end
    end

    context 'with 2 parameters and a query' do
      it 'builds a url' do
        query = { foo: 'bar' }

        expect(dummy.build_url(base_url, slug, params: query)).to eql 'http://test.com/testing?foo=bar'
      end
    end
  end
end