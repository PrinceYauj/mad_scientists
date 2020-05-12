# frozen_string_literal: true

RSpec.describe Byg::Models::Invention do
  it { is_expected.to respond_to(:update).with(1).argument }

  describe '.update' do
    subject(:update) { invention.update(params) }

    let(:invention) { create(:invention) }

    context 'with blank name' do
      let(:params) { { name: '' } }

      it { expect { update }.to raise_error(Sequel::ValidationFailed) }
    end

    context 'with name too long' do
      let(:params) { { name: 'a' * 256 } }

      it { expect { update }.to raise_error(Sequel::ValidationFailed) }
    end

    context 'with valid name' do
      let(:params) { { name: 'b' } }

      it 'changes DB[:inventions].name' do
        update
        expect(invention.reload.name).to be == 'b'
      end
    end

    context 'with negative power' do
      let(:params) { { power: -1 } }

      it { expect { update }.to raise_error(Sequel::ValidationFailed) }
    end

    context 'with power > 9000' do
      let(:params) { { power: 9001 } }

      it 'changes DB[:inventions].power' do
        update
        expect(invention.reload.power).to be == 9001
      end
    end

    context 'with nonexistent scientist' do
      let(:params) { { scientist_id: -10 } }

      it 'raises a Sequel::ForeignKeyConstraintViolation error' do
        expect { update }.to raise_error(Sequel::ForeignKeyConstraintViolation)
      end
    end

    context 'with existent scientist' do
      let(:params) { { scientist_id: create(:scientist, id: -1).id } }

      it 'changes DB[:inventions] scientist_id' do
        update
        expect(invention.reload.scientist_id).to be == -1
      end
    end

    context 'with nonexistent parameter' do
      let(:params) { { nonexistent_parameter: 300 } }

      it 'raises a Sequel::MassAssignmentRestriction error' do
        expect { update }.to raise_error(Sequel::MassAssignmentRestriction)
      end
    end
  end
end
