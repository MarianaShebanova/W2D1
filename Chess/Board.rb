require_relative 'piece'
require_relative 'null_piece'

class Board
    attr_reader :rows, :sentinel, :grid

    def initialize
        @rows = Array.new(8) { Array.new(8) }
        @null_piece= NullPiece.instance
        populate
    end

    def [](pos)
        row, col = pos
        @rows[row][col]
    end

    def []=(pos, val)
        row, col = pos
        @rows[row][col] = val
    end

    def populate
        @rows.each_with_index do |row, i|
            row.each_with_index do |col, j|
                if [0, 1, 6, 7].include? i
                    self[[i,j]] = Piece.new 
                else
                    self[[i, j]] = @null_piece 
                end 
            end
        end
    end

    def move_piece(color, start_pos, end_pos)
    end

    def valid_pos?(pos)
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
    end

end