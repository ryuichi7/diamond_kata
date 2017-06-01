module DiamondKata
  class TableBuilder
    attr_reader :letters, :row_template, :table

    def initialize(letter)
      @letters = [*'A'..letter.upcase]
      @row_template = Array.new(@letters.length, '_')
      @table = []
    end

    def call
      generate_rows
      table
    end

    private

    # reverse letters to start with center row. then build out diamond
    # from center
    def generate_rows
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
