
class Board
    attr_reader :rows
    def initialize
        @rows = Array.new(8) {Array.new(8)}
        
        # (0..7).each do |i|
        #     @rows[i].map! {|tile| tile = Piece.new} if i <= 1 || i >= 6
        # end
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
