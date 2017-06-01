require 'pry'
module DiamondKata
  class Diamond
    attr_accessor :table, :letters, :row_template

    def initialize(letter)
      @letters = [*'A'..letter.upcase]
      @row_template = Array.new(@letters.length, '_')
      @table = []
    end

    def print
      generate_table
      print_table
    end

    private

    def print_table
      table.map { |row| p row.join('') }
    end

    # reverse letters to start with center row. then build out diamond
    # from center
    def generate_table
      letters.reverse.each_with_index do |letter, index|
        row = build_row(letter, index)
        table << row
        table.unshift(row) unless index == 0
      end
    end

    # dup template and replace index with letter. then reverse and append
    def build_row(letter, index)
      row_template.dup.tap do |row|
        row[index] = letter
        row.concat(row.reverse[1..-1])
      end
    end
  end
end
