# frozen_string_literal: true

# scientist destruction should cause corresponding changes in DB

RSpec.describe Byg::Models::Scientist do
  it { is_expected.to respond_to(:destroy).with(0..1).arguments }

  describe '.destroy' do
    subject(:destroy) { instance.destroy }

    context 'when there are belonging inventions' do
      let(:instance) { create(:scientist, :with_inventions) }

      it 'raises ForeignKeyConstraintViolation error' do
        expect { destroy }
          .to raise_error(Sequel::ForeignKeyConstraintViolation)
      end
    end

    context 'when there are no inventions' do
      let!(:instance) { create(:scientist) }

      it 'destroys an instance' do
        destroy
        expect(described_class[instance.id]).to be_nil
      end
    end
  end
end
