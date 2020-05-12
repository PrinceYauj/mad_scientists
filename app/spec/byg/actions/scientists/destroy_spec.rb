# frozen_string_literal: true

RSpec.describe Byg::Actions::Scientists::Destroy do
  it { is_expected.to respond_to(:destroy).with(1).argument }
end
