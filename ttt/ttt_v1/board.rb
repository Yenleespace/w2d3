require 'byebug'

# Version 1: Make it work - Basic 3x3 grid game with 2 human player

class Board
    def initialize
        @grid = Array.new(3) {Array.new(3, '_')}
    end

    def [](pos)
        row = pos[0]
        col = pos[1]
        @grid[row][col]
    end

    def []=(pos, val)
        row = pos[0]
        col = pos[1]
        @grid[row][col] = val
    end

    def valid?(pos)
        return false if pos[0] > @grid.length - 1 || pos[1] > @grid.length - 1 || pos[0] < 0 || pos[1] < 0
        return true
    end

    def empty?(pos)
        # debugger
        
        return true if self[pos] == '_'
        return false
    end

    def place_mark(pos, mark)
        raise 'error' if !valid?(pos) || !empty?(pos)
        self[pos] = mark
    end

    def print
        @grid.each do |row|
            puts row.join(" ")
        end
    end

    def win_row?(mark)
        @grid.any? { |row| row.all?(mark)}
    end

    def win_col?(mark)
        @grid.transpose.any? { |col| col.all?(mark)}
    end

    def win_diagonal?(mark)
        (0...@grid.length).each do |i|
            return false if @grid[i][i] != mark
        end
        (0...@grid.length).each do |j|
            return false if @grid[j][@grid.length - 1 - i] != mark
        end
        true
    end

    def win?(mark)
        return true if win_row?(mark) || win_col?(mark) || win_diagonal?(mark)
        return false
    end

    def empty_positions?
        @grid.flatten.any? { |ele| ele == '_'}
    end
end

# b = Board.new
# b.place_mark([0, 2], :X)
# b.place_mark([1, 1], :X)
# b.place_mark([2, 0], :X)
# b.print
# p b.win?(:X)