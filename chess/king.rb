require_relative 'stepable'
require_relative 'piece'

class King < Piece
    include Stepable
    attr_reader :color, :board, :pos

    KING_VECTORS = [[0, 1], [1, 1], [1, 0], [1, -1], [0, -1], [-1, -1], [-1, 0], [-1, 1]]

    def symbol
        color == :black ? "♚" : "♔"
    end

    def move_diffs
        KING_VECTORS
    end
end