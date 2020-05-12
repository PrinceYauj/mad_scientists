# frozen_string_literal: true

RSpec.describe Byg::Models::Scientist do
  # Scientist should inherit from Sequel::Model
  it { is_expected.to be_a(Sequel::Model) }

  # Scientist should have parameters
  #:id, :madness, :attempts, :created_at

  it { is_expected.to respond_to(:id, :madness, :attempts, :created_at) }
end
