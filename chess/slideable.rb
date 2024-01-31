module Slideable

    HORIZONTAL_DIRS = [[0,1],[1,0],[0,-1],[-1,0]]
    DIAGONAL_DIRS = [[1,1],[1,-1],[-1,-1],[-1,1]]

    def horizontal_getter
        HORIZONTAL_DIRS
    end

    def diagonal_getter
        DIAGONAL_DIRS
    end

    def move_dirs
        raise StandardError
    end

    def moves(start_pos)
        move_dirs.each #reference to the move_dirs generated in each type of piece
    end
end