module Mastermind
  class Feedback
    attr_accessor :code, :guess

    def initialize(code, guess)
      @code  = code.split(' ')
      @guess = guess.split(' ')
    end

    def pegs
      returned_pegs = no_pegs

      add_pegs(returned_pegs)

      returned_pegs.join(' ')
    end

    private
    def no_pegs
      %w(- - - -)
    end
    def add_pegs(pegs)
      black_pegs = []
      white_pegs = []

      guess.each_with_index do |g, i|
        if code[i] == g
          black_pegs << 'B'
        elsif code.include?(g)
          white_pegs << 'W'
        end
      end

      (black_pegs + white_pegs).each_with_index do |peg, i|
        pegs[i] = peg
      end
    end
  end
end