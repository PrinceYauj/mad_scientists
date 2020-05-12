# frozen_string_literal: true

RSpec.describe Byg::Rest::Inventions do
  describe 'get /invention/:route_id' do
    let(:response) { JSON.parse(last_response.body, symbolize_names: true) }

    let(:request) { get "/inventions/#{create(:invention).id}" }

    it 'invokes Byg::Rest::Inventions#show method' do
      expect(described_class).to receive(:show)
      request
    end

    it 'returns a specified invention' do
      request
      expect(response).to be_a(Hash).and include(power: 1)
    end

    it 'returns an OK status' do
      request
      expect(last_response.status).to be == 200
    end
  end
end
