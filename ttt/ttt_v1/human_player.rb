class humanPlayer

    attr_reader :mark_value
    def initialize(mark_value)
        @mark = mark_value
    end

    def get_position
        pos = gets.chomp
        row, col = pos
    end
end