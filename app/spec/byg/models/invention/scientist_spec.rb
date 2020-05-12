# frozen_string_literal: true

RSpec.describe Byg::Models::Invention do
  it { is_expected.to respond_to(:scientist).with(0).arguments }

  describe '.scientist' do
    subject(:scientist) { instance.scientist }

    let(:instance) { create(:invention) }

    it { expect(instance.scientist).to be_a(Byg::Models::Scientist) }
    it { expect(instance.scientist.id).to be == instance.scientist_id }
  end
end
