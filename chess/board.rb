# 0[0..7]
# 1[0..7]
# 6[0..7]
# 7[0..7]

# rook => [0][0], [0][7], [7][0], [7][7]
# knight => [0][1], [0][6], [7][1], [7][6]
# bishop => [0][2], [0][5], [7][2], [7][5]
# queen => [0][3], [7][3]
# king => [0][4], [7][4]
# pawns => [1][0..7], [6][0..7]
# NullPiece => [2..5][0..7]

class Piece
    def initialize(color, rows, start_pos)
        @color = color
        @board = rows
        @pos = start_pos # => [3, 4] => [2, 3]
    end
end

class Board
    attr_reader :rows
    def initialize
        @rows = Array.new(8) {Array.new(8)}
        (0..7).each do |i|
            @rows[i].map! {|tile| tile = Piece.new} if i <= 1 || i >= 6
        end
    end
    
    def [](pos)
        row, col = pos
        @rows[row][col]
    end

    def []=(pos, val)
        row, col = pos
        @rows[row][col] = val
    end

    def move_piece(start_pos, end_pos)
        # Nil or NullPiece & end_pos validity
        raise 'Invalid move.' if self[start_pos].nil? || !self[end_pos].nil?
        piece = self[start_pos]
        self[end_pos] = piece
        self[start_pos] = nil
    end
end
