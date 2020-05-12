# frozen_string_literal: true

RSpec.describe Byg::Models::Scientist do
  it { is_expected.to respond_to(:update).with(1).argument }

  describe '.update' do
    subject(:update) { scientist.update(params) }

    let(:scientist) { create(:scientist) }

    context 'with negative madness' do
      let(:params) { { madness: -1 } }

      it { expect { update }.to raise_error(Sequel::ValidationFailed) }
    end

    context 'with positive madness' do
      let(:params) { { madness: 2 } }

      it 'changes DB[:scientists]' do
        update
        expect(scientist.reload.madness).to be == 2
      end
    end

    context 'with negative attempts' do
      let(:params) { { attempts: -1 } }

      it { expect { update }.to raise_error(Sequel::ValidationFailed) }
    end

    context 'with positive attempts' do
      let(:params) { { attempts: 2 } }

      it 'changes DB[:scientists]' do
        update
        expect(scientist.reload.attempts).to be == 2
      end
    end

    context 'with id change' do
      let(:params) { { id: -2 } }

      it { expect { update }.to raise_error(Sequel::NoExistingObject) }
    end

    context 'with nonexistent parameter' do
      let(:params) { { nonexistent_parameter: 300 } }

      it 'raises a Sequel::MassAssignmentRestriction error' do
        expect { update }.to raise_error(Sequel::MassAssignmentRestriction)
      end
    end
  end
end
