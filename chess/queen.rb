require_relative 'slideable'
require_relative 'piece'

class Queen < Piece
    include Slideable
    attr_reader :color, :board, :pos

    def move_vctrs
        STRAIGHT_VECTORS + DIAGONAL_VECTORS
    end
end

b = Board.new
q = Queen.new(:white, b, [0,0])
b[q.pos] = q
b[[4,0]] = Piece.new(:black, b, [4,0])
p q.moves