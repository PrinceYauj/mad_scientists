# frozen_string_literal: true

# invention destruction should cause corresponding changes in DB

RSpec.describe Byg::Models::Invention do
  it { is_expected.to respond_to(:destroy).with(0..1).arguments }

  describe '.destroy' do
    subject(:destroy) { instance.destroy }

    let!(:instance) { create(:invention) }

    it 'destroys an instance' do
      destroy
      expect(described_class[instance.id]).to be_nil
    end
  end
end
