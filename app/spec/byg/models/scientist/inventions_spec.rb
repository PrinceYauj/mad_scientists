# frozen_string_literal: true

RSpec.describe Byg::Models::Scientist do
  it { is_expected.to respond_to(:inventions).with(0).arguments }

  describe '.inventions' do
    subject(:invention) { instance.inventions }

    let(:instance) { create(:scientist, :with_inventions) }

    it { is_expected.to be_an(Array) }
    it { is_expected.to all(be_a(Byg::Models::Invention)) }

    it 'has inventions of the scientist' do
      expect(invention.map(&:scientist_id).uniq).to be == [instance.id]
    end
  end
end
