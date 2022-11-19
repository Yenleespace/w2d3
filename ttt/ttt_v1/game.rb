require_relative 'board.rb'
require_relative 'human_player.rb'

class Game

    def initialize(player_1_mark, player_2_mark)
        @player_1 = HumanPlayer.new(player_1_mark)
        @player_2 = HumanPlayer.new(player_2_mark)
        @board = Board.new
        @current_player = @player_1
    end

    def switch_turn
        if @current_player == @player_1
            @current_player = @player_2
        else
            @current_player = @player_1
        end
    end

    def play
        while @board.empty_positions?
            @board.print
            pos = @current_player.get_position
            @board.place_mark(pos, @current_player.mark)
            # self.switch_turn
            if @board.win?(@current_player.mark)
                puts "victory #{@current_player.mark}"
                puts 'end the game'
                return
            else
                self.switch_turn
            end
        end
        puts 'draw'
        puts 'end the game'
    end
end