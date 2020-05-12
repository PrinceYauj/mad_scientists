# frozen_string_literal: true

RSpec.describe Byg::Rest::Scientists do
  let(:response) { JSON.parse(last_response.body, symbolize_names: true) }

  let(:request) { post '/scientists', request_body }

  context 'when request body is valid' do
    let(:request_body) { '{"madness": 666,"attempts": 666}' }

    it 'invokes Byg::Rest::Scientists#create method' do
      expect(described_class).to receive(:create)
      request
    end

    it 'returns created scientist' do
      request
      expect(response).to be_a(Hash).and include(madness: 666)
    end

    it 'returns a :created status' do
      request
      expect(last_response.status).to be == 201
    end
  end

  context 'when request body is valid and contains id' do
    let(:request_body) { '{"madness": 1,"attempts": 1,"id": -1}' }

    it 'invokes Byg::Actions::Scientists#create method' do
      expect(described_class).to receive(:create)
      request
    end

    it 'returns created scientist' do
      request
      expect(response).to be_a(Hash).and include(id: -1)
    end

    it 'returns a :created status' do
      request
      expect(last_response.status).to be == 201
    end
  end

  context 'when request body is not a JSON string' do
    let(:request_body) { 'not a JSON string' }

    it 'returns JSON.parse error message' do
      request
      expect(response).to include('not a JSON string')
    end

    it 'returns 400 status' do
      request
      expect(last_response.status).to be == 400
    end
  end
end
