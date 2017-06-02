require 'spec_helper'

RSpec.describe DiamondKata::Program do
  subject { DiamondKata::Program }

  describe '.run' do
    context 'messages' do
      before do
        expect(subject).to receive(:gets).and_return("A")
        subject.stub(:gets).and_return("exit")
      end

      context 'when valid input' do
        it 'prints a greeting' do
          expect { subject.run }.to output(/please enter a letter/).to_stdout
        end

        it 'prints exit message' do
          expect { subject.run }.to output(/goodbye/).to_stdout
        end
      end

      context 'when invalid input' do
        before do
          expect(subject).to receive(:gets).and_return("1kj")
          subject.stub(:gets).and_return("exit")
        end

        it 'prints error message' do
          expect { subject.run }.to output(/not a valid input/).to_stdout
        end
      end
    end

    context 'diamond output' do
      context 'when letter is a' do
        before do
          expect(subject).to receive(:gets).and_return("a")
          subject.stub(:gets).and_return("exit")
        end

        it 'prints correct diamond' do
          expect { subject.run }.to output(/\"A\"\n/).to_stdout
        end
      end

      context 'when letter is c' do
        let(:correct_output) do
          /\"__A__\"\n\"_B_B_\"\n\"C___C\"\n\"_B_B_\"\n\"__A__\"\n/
        end

        before do
          expect(subject).to receive(:gets).and_return("c")
          subject.stub(:gets).and_return("exit")
        end

        it 'prints correct diamond' do
          expect { subject.run }.to output(correct_output).to_stdout
        end
      end
    end
  end
end
