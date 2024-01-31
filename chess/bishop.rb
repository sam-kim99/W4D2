require_relative 'slideable'
require_relative 'piece'

class Bishop < Piece
    include Slideable
    attr_reader :color, :board, :pos

    def symbol
        color == :black ? "♝" : "♗"
    end

    def move_vctrs
        DIAGONAL_VECTORS
    end
end
