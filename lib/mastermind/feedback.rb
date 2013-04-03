module Mastermind
  class Feedback
    attr_accessor :code, :guess

    def initialize(code, guess)
      @code  = code.split(' ')
      @guess = guess.split(' ')
    end

    def pegs
      returned_pegs = no_pegs

      evaluate_guess!

      (black_pegs + white_pegs).each_with_index do |peg, i|
        returned_pegs[i] = peg
      end

      returned_pegs.join(' ')
    end

    private
    def no_pegs
      %w(- - - -)
    end

    def evaluate_guess!
      guess.each_with_index do |g, i|
        if code[i] == g
          black_pegs << 'B'
          white_pegs.pop #Keep peg from being marked both
          marked_pegs << g
        elsif code.include?(g) && !marked_pegs.include?(g)
          white_pegs << 'W'
        end
      end
    end

    def black_pegs
      @black_pegs ||= []
    end

    def white_pegs
      @white_pegs ||= []
    end

    def marked_pegs
      @marked_pegs ||= []
    end
  end
end