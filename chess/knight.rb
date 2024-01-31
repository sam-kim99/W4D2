require_relative 'stepable'
require_relative 'piece'

class Knight < Piece
    include Stepable
    attr_reader :color, :board, :pos
    
    KNIGHT_VECTORS = [[2, 1], [1, 2], [-1, 2], [-2, 1], [-2, -1], [-1, -2], [1, -2], [2, -1]]

    def symbol
        color == :black ? "♞" : "♘"
    end

    def move_diffs
        KNIGHT_VECTORS
    end
end