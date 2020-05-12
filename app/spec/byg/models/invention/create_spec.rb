# frozen_string_literal: true

RSpec.describe Byg::Models::Invention do
  it { expect(described_class).to respond_to(:create).with(1).argument }

  describe '.create' do
    context 'with valid parameters' do
      it 'creates a DB[:inventions] entry' do
        expect { create(:invention) }.to change(DB[:inventions], :count).by(1)
      end
    end

    context 'with blank name' do
      it 'raises an Sequel::ValidationFailed error' do
        expect { create(:invention, name: '') }
          .to raise_error(Sequel::ValidationFailed)
      end
    end

    context 'with name too long' do
      it 'raises Sequel::ValidationFailed error' do
        expect { create(:invention, name: 'a' * 256) }
          .to raise_error(Sequel::ValidationFailed)
      end
    end

    context 'with negative power' do
      it 'raises Sequel::ValidationFailed error' do
        expect { create(:invention, power: -1) }
          .to raise_error(Sequel::ValidationFailed)
      end
    end

    context 'with nonexistent scientist.id parameter' do
      it 'raises Sequel::ForeignKeyConstraintViolation error' do
        expect { create(:invention, scientist_id: -1) }
          .to raise_error(Sequel::ForeignKeyConstraintViolation)
      end
    end

    context 'with already existing id' do
      it 'raises an Sequel::UniqueConstraintViolation error' do
        create(:invention, id: 1)
        expect { create(:invention, id: 1) }
          .to raise_error(Sequel::UniqueConstraintViolation)
      end
    end
  end
end
