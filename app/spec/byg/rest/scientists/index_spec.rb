# frozen_string_literal: true

RSpec.describe Byg::Rest::Scientists do
  subject(:request) { get '/scientists' }

  let(:response) { JSON.parse(last_response.body, symbolize_names: true) }

  before { create(:scientist) }

  it 'invokes Byg::Rest::Scientists#index method' do
    expect(described_class).to receive(:index)
    request
  end

  it 'returns a list of scientists' do
    request
    expect(response).to be_an(Array)
  end

  it 'returns an array of hashes' do
    request
    expect(response).to all(be_a(Hash))
  end

  it 'returns an OK status' do
    request
    expect(last_response.status).to be == 200
  end
end
