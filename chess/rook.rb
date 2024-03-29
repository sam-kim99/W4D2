require_relative 'slideable'
require_relative 'piece'

class Rook < Piece
    include Slideable
    attr_reader :color, :board, :pos

    def symbol
        color == :black ? "♜" : "♖"
    end

    def move_vctrs
        STRAIGHT_VECTORS
    end
end
