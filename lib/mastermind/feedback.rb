module Mastermind
  class Feedback
    attr_accessor :code, :guess

    def initialize(code, guess)
      @code  = code.split(' ')
      @guess = guess
    end

    def pegs
      returned_pegs = no_pegs

      unless no_correct_colors?
        white_pegs.each_with_index do |white_peg, i|
          returned_pegs[i] = white_peg
        end

       black_pegs.each_with_index do |black_peg, i|
          returned_pegs[i] = black_peg
        end
      end

      returned_pegs.join(' ')
    end

    def no_correct_colors?
      not code.any? do |c|
        guess.include?(c)
      end
    end

    def white_pegs
      pegs = []

      code.each do |c|
        pegs << 'W' if guess.include?(c)
      end

      pegs
    end

    def black_pegs
      pegs = []


      guess.split(' ').each_with_index do |g,i|
        pegs << 'B' if code[i] == g
      end

      pegs
    end

    private
    def no_pegs
      %w(- - - -)
    end
  end
end