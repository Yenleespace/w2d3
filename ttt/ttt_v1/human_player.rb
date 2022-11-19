class HumanPlayer
    attr_reader :mark

    def initialize(mark_value)
        @mark = mark_value
    end

    def get_position
        puts "Player #{self.mark}, enter two numbers representing a position in the format `row col`"
        pos = gets.chomp.split(" ").map { |i|i.to_i }
        raise 'error' if pos.length != 2
        pos
    end
end

# player_1 = HumanPlayer.new(:X)
# player_1.mark
# player_1.get_position