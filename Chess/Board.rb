require_relative 'piece'
require_relative 'null_piece'

class Board
    attr_reader :rows, :sentinel, :grid

    def initialize
        @rows = Array.new(8) { Array.new(8) }
        @sentinel= NullPiece.instance
        populate
    end

    def [](pos)
        row, col = pos
        @rows[row][col]
    end

    def []=(pos, piece)
        row, col = pos
        @rows[row][col] = piece 
    end

    def populate
        @rows.each_with_index do |row, i|
            row.each_with_index do |col, j|
                if [0, 1, 6, 7].include? i
                    self[[i, j]] = Piece.new 
                else
                    self[[i, j]] = @sentinel 
                end 
            end
        end
    end

    def move_piece(color, start_pos, end_pos)
        #raise "there is no piece" if self[start_pos].empty?
        raise "the piece cannot be moved" if !valid_pos?(end_pos)
        raise "wrong start_pos" if !valid_pos?(start_pos)
        
        move_piece!(color, start_pos, end_pos)
    end

    def valid_pos?(pos)
       pos.first.between?(0, 7) && pos.last.between?(0, 7)
    end

    def add_piece(piece, pos)
    end

    def checkmate?(color)
    end

    def in_check?(color)
    end

    def find_king(color)
    end

    def pieces
    end

    def dup
    end

    def move_piece!(color, start_pos, end_pos)
        self[end_pos] = self[start_pos]
        self[start_pos] = @sentinel
    end

end