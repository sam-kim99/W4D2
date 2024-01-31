require_relative 'slideable'
require_relative 'piece'

class Queen < Piece
    include Slideable
    attr_reader :color, :board, :pos

    def move_vctrs
        STRAIGHT_VECTORS + DIAGONAL_VECTORS
    end
end
