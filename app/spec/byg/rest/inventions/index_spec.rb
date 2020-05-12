# frozen_string_literal: true

RSpec.describe Byg::Rest::Inventions do
  subject(:request) { get '/inventions' }

  let(:response) { JSON.parse(last_response.body, symbolize_names: true) }

  before { create(:invention) }

  it 'invokes Byg::Rest::Inventions#index method' do
    expect(described_class).to receive(:index)
    request
  end

  it 'returns list of inventions' do
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
