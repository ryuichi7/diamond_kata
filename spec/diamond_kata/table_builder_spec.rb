require 'spec_helper'

RSpec.describe DiamondKata::TableBuilder do
  let(:table_builder) { described_class.new('A') }

  describe 'initialize' do
    it 'assigns @table' do
      expect(table_builder.table).to eq []
    end

    context 'row_template' do

      it 'assigns @row_template' do
        expect(table_builder.table).to eq []
      end

      context 'when further down alphabet' do
        let(:table_builder) { described_class.new('D') }

        it 'creates template for letters array length' do
          expect(table_builder.row_template).to eq ['_', '_', '_', '_']
        end
      end
    end

    context 'letters' do
      it 'assigns @letters' do
        expect(table_builder.letters).to eq ['A']
      end

      context 'when further down alphabet' do
        let(:table_builder) { described_class.new('D') }

        it 'creates alphabet array to letter' do
          expect(table_builder.letters).to eq ['A', 'B', 'C', 'D']
        end
      end

      context 'when letter is lower case' do
        let(:table_builder) { described_class.new('c') }

        it 'upcases all letters' do
          expect(table_builder.letters).to eq ['A', 'B', 'C']
        end
      end
    end
  end

  describe '#call' do
    context 'when letter is "A"' do
      it 'returns correct array' do
        expect(table_builder.call).to eq([['A']])
      end
    end

    context 'when letter is "B"' do
      let(:table_builder) { described_class.new('B') }

      let(:expectation) do
        [
          ["A"],
          ["B","_", "B"],
          ["A"]
        ]
      end

      it 'returns correct array' do
        expect(table_builder.call).to eq expectation
      end
    end

    context 'when letter is "C"' do
      let(:table_builder) { described_class.new('C') }

      let(:expectation) do
        [
          ["A"],
          [ "B","_", "B"],
          ["C", "_", "_", "_", "B"],
          ["B","_", "B"],
          ["A"]
        ]
      end

      it 'returns correct array' do
        expect(table_builder.call).to eq expectation
      end
    end
  end

  # context 'when letter is A' do
  #   let(:template) {  }
  #
  #   it 'returns row' do
  #     expect(subject.call(template, 'A')).to eq 'A'
  #   end
  # end
  #
  # context 'when letter is B' do
  #   it 'returns row' do
  #     expect(subject.call('B')).to eq '_B_'
  #   end
  # end
end
