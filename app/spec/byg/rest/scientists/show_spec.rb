# frozen_string_literal: true

RSpec.describe Byg::Rest::Scientists do
  let(:response) { JSON.parse(last_response.body, symbolize_names: true) }

  let(:request) { get "/scientists/#{create(:scientist).id}" }

  it 'invokes Byg::Rest::Scientists#show method' do
    expect(described_class).to receive(:show)
    request
  end

  it 'returns a specified scientist' do
    request
    expect(response).to be_a(Hash).and include(attempts: 1)
  end

  it 'returns an OK status' do
    request
    expect(last_response.status).to be == 200
  end
end
