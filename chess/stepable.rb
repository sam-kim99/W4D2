module Stepable
    def move_diffs
        raise NotImplementedError.new
    end

    def pos
        raise NotImplementedError.new
    end

    def board
        raise NotImplementedError.new
    end

    def moves
        positions = []
        move_diffs.each do |vector|
            positions += hop(vector)
        end
        positions
    end

    def hop(vector)
        result = []
        row, col = pos
        drow, dcol = vector
        new_pos = [row + drow, col + dcol]
        if new_pos[0] <= 7 && new_pos[0] >= 0 && new_pos[1] <= 7 && new_pos[1] >= 0 
            if board[new_pos].nil? # board[new_pos].color != board[pos].color
                result << new_pos
            end
        end
        result
    end
end