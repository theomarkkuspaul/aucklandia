
RSpec.describe Aucklandia::Client do
  describe '#initialize' do
    it 'raises an ArgumentError exception if no authorization key is provided' do
      expect {
        described_class.new
      }.to raise_error(ArgumentError)
    end

    it 'sets the authorization_key' do
      auth_key = 'password123'
      client   = described_class.new(auth_key)

      expect(client.authorization_key).to eq auth_key
    end
  end
end