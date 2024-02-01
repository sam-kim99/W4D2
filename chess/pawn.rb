require_relative 'piece'

class Pawn < Piece
    attr_reader :color, :board, :pos

    def symbol
        color == :black ? "♟" : "♙"
    end

    def moves
        # at_start_row
        positions = []
        if color == :white
            if at_start_row?
                steps = [[1, 0], [2, 0]]
                positions += forward_steps(steps)
            else
                steps = [[1,0]]
                positions += forward_steps(steps) + side_attacks
            end
        else
            if at_start_row?
                steps = [[-1, 0], [-2, 0]]
                positions += forward_steps(steps)
            else
                steps = [[-1,0]]
                positions += forward_steps(steps) + side_attacks
            end
        end
        positions
    end

    private

    def at_start_row?
        if color == :white
            pos[0] == 1 ? true : false
        else
            pos[0] == 6 ? true : false
        end
    end

    def forward_dir
        return 1 if color == :white
        return -1
    end

    def forward_steps(steps)
        next_steps = []
        steps.each do |step|
            dx, dy = step
            x, y = pos
            new_pos = [x + dx, y + dy]
            next_steps << new_pos
        end
        next_steps
    end

    def side_attacks
        if color == :white
            corners = [[1, 1], [1, -1]]
            attack_moves = forward_steps(corners)
            return attack_moves.select {|pos| board[pos].is_a?(Piece) && board[pos].color == :black}
        else
            corners = [[-1, -1], [-1, 1]]
            attack_moves = forward_steps(corners)
            return attack_moves.select {|pos| board[pos].is_a?(Piece) && board[pos].color == :white}
        end
    end
end

b = Board.new
p1 = Pawn.new(:white, b, [1,0]) # 2, 0 + 3, 0
p3 = Pawn.new(:black, b, [2,1]) # 1, 0 + 1, 1
p2 = Pawn.new(:white, b, [2,2]) # 3, 3 + 3, 2
p4 = Pawn.new(:black, b, [3,3]) # 2, 2 + 2, 3

b[[1, 0]] = p1
b[[2, 1]] = p3
b[[2, 2]] = p2
b[[3, 3]] = p4

p p1.moves
p p3.moves
p p2.moves
p p4.moves