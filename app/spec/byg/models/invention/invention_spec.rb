# frozen_string_literal: true

RSpec.describe Byg::Models::Invention do
  # Invention should inherit from Sequel::Model
  it { is_expected.to be_a(Sequel::Model) }

  # Invention should have parameters
  #:id, :scientist_id, :name, :power, :created_at

  it 'has parameters' do
    expect(described_class.new).to respond_to(:id, :scientist_id, :name, :power,
                                              :created_at)
  end
end
