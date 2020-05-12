# frozen_string_literal: true

RSpec.describe Byg::Actions::Inventions::Show do
  it { is_expected.to respond_to(:show).with(1).argument }
end
