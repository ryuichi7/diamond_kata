require 'spec_helper'

RSpec.describe DiamondKata::RowBuilder do
  subject { described_class }

  let(:template) { '___' }

  describe '#call' do
    context 'when letter is A' do
      it 'returns row' do
        expect(subject.call('A')).to eq 'A'
      end
    end

    context 'when letter is B' do
      it 'returns row' do
        expect(subject.call('B')).to eq '_B_'
      end
    end
  end
end
