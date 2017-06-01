require 'spec_helper'

RSpec.describe DiamondKata::Diamond do
  let(:diamond) { described_class.new('A') }

  describe 'initialize' do
    it 'assigns @table' do
      expect(diamond.table).to eq []
    end

    context 'row_template' do

      it 'assigns @row_template' do
        expect(diamond.table).to eq []
      end

      context 'when further down alphabet' do
        let(:diamond) { described_class.new('D') }

        it 'creates template for letters array length' do
          expect(diamond.row_template).to eq ['_', '_', '_', '_']
        end
      end
    end

    context 'letters' do
      it 'assigns @letters' do
        expect(diamond.letters).to eq ['A']
      end

      context 'when further down alphabet' do
        let(:diamond) { described_class.new('D') }

        it 'creates alphabet array to letter' do
          expect(diamond.letters).to eq ['A', 'B', 'C', 'D']
        end
      end

      context 'when letter is lower case' do
        let(:diamond) { described_class.new('c') }

        it 'upcases all letters' do
          expect(diamond.letters).to eq ['A', 'B', 'C']
        end
      end
    end
  end

  describe '#print' do
    context 'when letter is "A"' do
      it 'returns correct array' do
        expect { diamond.print }.to output("\"A\"\n").to_stdout
      end
    end

    context 'when letter is "B"' do
      let(:diamond) { described_class.new('B') }

      let(:expectation) do
        "\"_A_\"\n\"B_B\"\n\"_A_\"\n"
      end

      it 'returns correct array' do
        expect { diamond.print }.to output(expectation).to_stdout
      end
    end

    context 'when letter is "C"' do
      let(:diamond) { described_class.new('C') }

      let(:expectation) do
        "\"__A__\"\n\"_B_B_\"\n\"C___C\"\n\"_B_B_\"\n\"__A__\"\n"
      end

      it 'returns correct array' do
        expect { diamond.print }.to output(expectation).to_stdout
      end
    end
  end
end
