# frozen_string_literal: true

RSpec.describe Byg::Rest::Inventions do
  let(:response) { JSON.parse(last_response.body, symbolize_names: true) }

  let(:request) { post '/inventions', request_body }

  context 'when request body is valid' do
    let(:request_body) do
      "{\"name\":\"aa\",\"power\":2,
      \"scientist_id\":#{create(:scientist, id: 1).id}}"
    end

    it 'invokes Byg::Rest::Inventions#create method' do
      expect(described_class).to receive(:create)
      request
    end

    it 'returns created invention' do
      request
      expect(response).to be_a(Hash).and include(name: 'aa')
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
