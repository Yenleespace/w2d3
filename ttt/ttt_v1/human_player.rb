class humanPlayer

    attr_reader :mark_value
    def initialize(mark_value)
        @mark = mark_value
    end

    def get_position
        pos = gets.chomp
        raise 'error' if pos.length != 2 
        row, col = pos
    end
end