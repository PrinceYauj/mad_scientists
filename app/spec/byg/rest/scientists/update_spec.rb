# frozen_string_literal: true

RSpec.describe Byg::Rest::Scientists do
  describe '.update' do
    let!(:scientist) { create(:scientist, :with_inventions) }
    let(:response) { JSON.parse(last_response.body, symbolize_names: true) }
    let(:request) { put "/scientists/#{scientist.id}", request_body }

    context 'when request body is valid' do
      let(:request_body) { { madness: 999, attempts: 999 }.to_json }

      it 'invokes Byg::Rest::Scientists#update method' do
        expect(described_class).to receive(:update)
        request
      end

      it 'returns updated scientist' do
        request
        expect(response).to be_a(Hash).and include(madness: 999)
      end

      it 'returns an OK status' do
        request
        expect(last_response.status).to be == 200
      end
    end

    context 'when id updating will change dependent FK' do
      let(:request_body) { { id: -1 }.to_json }

      it 'will raise ForeignKeyCoinstraintVoilation error' do
        request
        expect(response[0]).to include('update or delete on table "scientis')
      end
    end

    context 'when created_at to be updated' do
      let(:request_body) { { created_at: Time.new(2000) }.to_json }

      it 'does not update created_at' do
        request
        # due to_json and JSON.parse transforms, Time becomes a string
        # decided to compare a strings rather then parse it into a Time
        expect(response[:created_at]).to be > Time.new(2010).to_s
      end
    end

    context 'when request body is not valid' do
      let(:request_body) { { nonexistent_attr: 300 }.to_json }

      it 'returns Sequel::MassAssignmentRestriction' do
        request
        expect(response[0]).to include('method nonexistent_attr= doesn\'t exis')
      end

      it 'returns 400 status' do
        request
        expect(last_response.status).to be == 400
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
end
