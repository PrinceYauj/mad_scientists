# frozen_string_literal: true

RSpec.describe Byg::Models::Scientist do
  it { expect(described_class).to respond_to(:new).with(1).argument }

  describe '.new' do
    subject(:new_scientist) { described_class.new(params) }

    def errors_count(scientist)
      scientist.valid?
      scientist.errors.count
    end

    context 'when parameters are invalid' do
      let(:params) { { madness: -1, attempts: -1 } }

      it { is_expected.not_to be_valid }

      it { expect(errors_count(new_scientist)).to be == 2 }
    end

    context 'when madness is negative' do
      let(:params) { { madness: -1, attempts: 1 } }

      it { is_expected.not_to be_valid }

      it { expect(errors_count(new_scientist)).to be == 1 }
    end

    context 'when attempts are negative' do
      let(:params) { { madness: 1, attempts: -1 } }

      it { is_expected.not_to be_valid }

      it { expect(errors_count(new_scientist)).to be == 1 }
    end

    context 'when parameters are valid' do
      let(:params) { { madness: 1, attempts: 1, id: -1 } }

      it { expect(new_scientist).to be_valid }
    end
  end
end
