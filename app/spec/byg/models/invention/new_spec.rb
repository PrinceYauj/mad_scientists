# frozen_string_literal: true

RSpec.describe Byg::Models::Invention do
  it { expect(described_class).to respond_to(:new).with(1).argument }

  describe '.new' do
    subject(:new_invention) { described_class.new(params) }

    def errors_count(invention)
      invention.valid?
      invention.errors.count
    end

    context 'when parameters are invalid' do
      let(:params) { { name: '', power: -1, scientist_id: nil } }

      it { is_expected.not_to be_valid }

      it { expect(errors_count(new_invention)).to be == 3 }
    end

    context 'when power is negative' do
      let(:params) { { name: 'a', power: -1, scientist_id: 1 } }

      it { is_expected.not_to be_valid }

      it { expect(errors_count(new_invention)).to be == 1 }
    end

    context 'when name is blank' do
      let(:params) { { name: '', power: 1, scientist_id: 1 } }

      it { is_expected.not_to be_valid }

      it { expect(errors_count(new_invention)).to be == 1 }
    end

    context 'when name is too long' do
      let(:params) { { name: 'a' * 256, power: 1, scientist_id: 1 } }

      it { is_expected.not_to be_valid }

      it { expect(errors_count(new_invention)).to be == 1 }
    end

    context 'when scientist_id is nil' do
      let(:params) { { name: 'a', power: 1, scientist_id: nil } }

      it { is_expected.not_to be_valid }

      it { expect(errors_count(new_invention)).to be == 1 }
    end

    context 'when parameters are valid' do
      let(:params) { { name: 'a', power: 1, scientist_id: -1, id: -1 } }

      it { expect(new_invention).to be_valid }
    end
  end
end
