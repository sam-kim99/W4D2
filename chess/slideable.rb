module Slideable

    STRAIGHT_VECTORS = [[0,1],[1,0],[0,-1],[-1,0]]
    DIAGONAL_VECTORS = [[1,1],[1,-1],[-1,-1],[-1,1]]

    def moves
        positions = []
        move_vctrs.each do |vector|
            positions += march(vector)
        end
        positions
    end

    def move_vctrs
        raise NotImplementedError.new
    end

    def pos
        raise NotImplementedError.new
    end

    def board
        raise NotImplementedError.new
    end

    private

    def march(vector)
        result = []
        current_pos = pos
        row, col = current_pos
        drow, dcol = vector
        new_pos = [row + drow, col + dcol] #[1,0]
        until new_pos[0] > 7 || new_pos[0] < 0 || new_pos[1] > 7 || new_pos[1] < 0 # if row + drow > 7 || < 0 + col + dcol > 7 || < 0
            if board[new_pos].nil?
                result << new_pos #shovel new pos? 
                row, col = new_pos  #want it to be [2,0], [3,0] etc
                new_pos = [row + drow, col + dcol]            
            else          
                case board[new_pos].color
                when board[pos].color
                    return result
                else
                    result << new_pos
                    return result
                end
            end
        end

        result
    end
end