RSpec.describe Aucklandia do
  it "has a version number" do
    expect(Aucklandia::VERSION).not_to be nil
  end

  it 'has a base url endpoint' do
    expect(described_class::BASE_URL).to eq "https://api.at.govt.nz/v2"
  end
end
