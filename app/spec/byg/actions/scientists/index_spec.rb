# frozen_string_literal: true

RSpec.describe Byg::Actions::Scientists::Index do
  it { is_expected.to respond_to(:index).with(0).arguments }
end
