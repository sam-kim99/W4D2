class Queen < Piece
    include Slideable
    def move_dirs
        horizontal_getter + diagonal_getter 
    end
end