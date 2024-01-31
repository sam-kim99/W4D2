require 'singleton'

class NullPiece < Piece
    include Singleton
    attr_reader :color, :symbol

    def initialize
        @color = nil
    end
    
    def moves
        []
    end

    def empty?
        true
    end
end