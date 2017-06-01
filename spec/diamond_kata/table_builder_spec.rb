require 'spec_helper'

RSpec.describe DiamondKata::TableBuilder do

  describe 'initialize' do
    let(:table_builder) { described_class.new('A') }

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
