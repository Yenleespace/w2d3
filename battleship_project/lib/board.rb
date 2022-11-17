require 'byebug'

class Board
    def initialize(n)
        @grid = Array.new(n) {Array.new(n, :N)}
        @size = n * n
    end

    def size
        @size
    end

    def [](pos)
        row = pos[0]
        col = pos[1]
        @grid[row][col]
    end

    def []=(pos, value)
        row = pos[0]
        col = pos[1]
        @grid[row][col] = value
    end

    def num_ships
        count = 0
        @grid.flatten.each { |ele| count += 1 if ele == :S}
        count
    end

    def attack(pos)
        # debugger
        if self[pos] == :S
            self[pos] = :H
            puts 'you sunk my battleship!'
            return true
        else
            self[pos] = :X
            return false
        end
    end 

    def place_random_ships
        mark = (@size * 0.25).to_i
        count = 0
        until count == mark 
            row = rand(0...@grid.length)
            col = rand(0...@grid.length)
            if @grid[row][col] != :S
                @grid[row][col] = :S
                count += 1
            end
        end
    end

    def hidden_ships_grid
        @grid.map do |row|
            row.map do |ele|
                if ele == :S
                    ele = :N
                else
                    ele
                end
            end
        end
    end

    def self.print_grid(grid)
        grid.each do |row|
            puts row.join(" ")
        end
    end

    def cheat
        Board.print_grid(@grid)
    end

    def print
        Board.print_grid(self.hidden_ships_grid)
    end

end
