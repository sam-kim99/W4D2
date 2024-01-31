require_relative 'board'

class Piece
    attr_reader :color, :board
    attr_accessor :pos

    def initialize(color, rows, start_pos)
        @color = color
        @board = rows
        @pos = start_pos # => [3, 4] => [2, 3]
    end
    
    def symbol
        " "
    end

    def to_s
        puts symbol
    end

    def empty?
        false
    end

    def valid_moves
        moves
    end

    # def move_into_check?(end_pos)
    #     #access subclasses's moves.
    #     #check if end_pos is included in moves?
    #     #if it is included, then check if the board[end_pos] is a King piece
    # end
end
