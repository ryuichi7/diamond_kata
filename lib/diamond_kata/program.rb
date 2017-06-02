module DiamondKata
  class Program
    GREETING_PROMPT = 'please enter a letter or enter "exit" to leave'.freeze
    ERROR_MESSAGE = 'not a valid input'.freeze
    LEAVE_MESSAGE = 'goodbye'.freeze

    class << self
      def run
        p GREETING_PROMPT

        input = get_input

        if input == 'exit'
          p LEAVE_MESSAGE
        else
          execute_command(input)
        end
      end

      private

      def execute_command(input)
        if valid_input?(input)
          Diamond.new(input).print
          run
        else
          p ERROR_MESSAGE
          run
        end
      end

      def get_input
        gets.strip
      end

      def valid_input?(input)
        input.length == 1 &&
        !!(input =~ /[A-Za-z]/)
      end
    end
  end
end
