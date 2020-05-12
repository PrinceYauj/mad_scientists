# frozen_string_literal: true

RSpec.describe Byg::Rest do
  context 'with random route' do
    let(:route) { '/random_route' }

    it 'says surprise, motherfucker' do
      get route.to_s
      expect(last_response.body).to include('Surprise, motherfucker')
    end

    it 'returns 404 on GET request' do
      get route.to_s
      expect(last_response.status).to be == 404
    end

    it 'returns 404 on POST request' do
      post route.to_s
      expect(last_response.status).to be == 404
    end

    it 'returns 404 on PUT request' do
      put route.to_s
      expect(last_response.status).to be == 404
    end

    it 'returns 404 on DELETE request' do
      delete route.to_s
      expect(last_response.status).to be == 404
    end
  end
end
