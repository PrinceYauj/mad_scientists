# frozen_string_literal: true

RSpec.describe Byg::Actions::Scientists::Update do
  subject { described_class.new(params) }

  let(:params) { {} }

  it { is_expected.to respond_to(:update).with(0).arguments }
end
