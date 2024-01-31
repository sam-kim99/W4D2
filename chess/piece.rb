require_relative 'board'

class Piece
    attr_reader :color, :board, :pos
    def initialize(color, rows, start_pos)
        @color = color
        @board = rows
        @pos = start_pos # => [3, 4] => [2, 3]
    end
end