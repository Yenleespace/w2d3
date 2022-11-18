require 'byebug'

class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  def self.valid_pegs?(array)
    array.each do |ele|
      return false if !POSSIBLE_PEGS.has_key?(ele.upcase)
    end
    true
  end

  def initialize(array)
    if Code.valid_pegs?(array)
      @pegs = array.map { |ele| ele.upcase }
    else
      raise 'error'
    end
  end

  def pegs
    @pegs
  end

  def self.random(length)
    random_pegs = []
    length.times do
      random_pegs << POSSIBLE_PEGS.keys.sample
    end
    # debugger
    Code.new(random_pegs)
  end

  def self.from_string(pegs)
    Code.new(pegs.split(''))
  end

  def [](index)
    @pegs[index]
  end

  def length
    @pegs.length
  end

  def num_exact_matches(code)
    count = 0
    (0...self.pegs.length).each { |i| count += 1 if @pegs[i] == code[i]}
    count
    # p code
    # p self
  end

  def num_near_matches(code)
    # debugger
    count = 0
    code.pegs.each.with_index do |ele, i|
      # debugger
      count += 1 if @pegs.include?(ele) && @pegs[i] != code.pegs[i]
    end
    count
  end

end
