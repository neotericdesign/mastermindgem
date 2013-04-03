require 'spec_helper'

module Mastermind
  describe Feedback do
    let(:code)            { "R Y G B" }
    let(:incorrect_guess) { "O P W C" }

    describe "#pegs" do
      context "when there are no correct guesses" do
        it "returns no pegs" do
          feedback = Feedback.new(code, incorrect_guess)

          feedback.pegs.should == '- - - -'
        end
      end

      context "when there is 1 correct color" do
        it "returns one white peg" do
          guess = "Y P W C"
          feedback = Feedback.new(code, guess)

          feedback.pegs.should == "W - - -"
        end
      end

      context "When there are 2 correct colors 1 correct position" do
        it "returns 1 black peg and 1 white peg" do
          feedback = Feedback.new(code, "R B P W")

          feedback.pegs.should == "B W - -"
        end
      end
    end
  end
end