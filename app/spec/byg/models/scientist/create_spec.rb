# frozen_string_literal: true

RSpec.describe Byg::Models::Scientist do
  it { expect(described_class).to respond_to(:create).with(1).argument }

  describe '.create' do
    context 'with valid parameters' do
      it 'creates a DB[:scientists] entry' do
        expect { create(:scientist) }.to change(DB[:scientists], :count).by(1)
      end
    end

    context 'with invalid madness parameter' do
      it 'raises Sequel::ValidationFailed error' do
        expect { create(:scientist, madness: -1) }
          .to raise_error(Sequel::ValidationFailed)
      end
    end

    context 'with invalid attempts parameter' do
      it 'raises Sequel::ValidationFailed error' do
        expect { create(:scientist, attempts: -1) }
          .to raise_error(Sequel::ValidationFailed)
      end
    end

    context 'with not unique id' do
      it 'raises Sequel::UniqueConstraintViolation error' do
        create(:scientist, id: 1)
        expect { create(:scientist, id: 1) }
          .to raise_error(Sequel::UniqueConstraintViolation)
      end
    end
  end
end
