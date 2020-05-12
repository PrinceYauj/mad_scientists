# frozen_string_literal: true

RSpec.describe Byg::Actions::Scientists::Create do
  it { is_expected.to respond_to(:create).with(1).argument }
end
