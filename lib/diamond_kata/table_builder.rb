module DiamondKata
  class TableBuilder
    attr_reader :letters, :row_template, :table

    def initialize(letter)
      @letters = [*'A'..letter.upcase]
      @row_template = Array.new(@letters.length, '_')
      @table = []
    end
  end
end
