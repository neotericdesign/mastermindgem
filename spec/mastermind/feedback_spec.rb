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

    describe "#no_correct_colors?" do
      it "returns true for no correct colors" do
        feedback = Feedback.new(code, incorrect_guess)

        feedback.should be_no_correct_colors
      end

      it "returns false for any correct colors" do
        feedback = Feedback.new(code, "Y P W C")

        feedback.should_not be_no_correct_colors
      end
    end

    describe "#white_pegs" do
      it "returns a W for each correct color" do
        feedback = Feedback.new(code, "Y P W C")
        pegs     = feedback.white_pegs

        pegs.should == ["W"]
      end

      it "returns empty array  for no correct colors" do
        feedback = Feedback.new(code, "O W P C")
        pegs     = feedback.white_pegs

        pegs.should == []
      end
    end
    describe "#black_pegs" do
      it "returns a B for each correct position" do
        feedback = Feedback.new(code, "R P W C")
        pegs     = feedback.black_pegs

        pegs.should == ["B"]
      end

      it "returns empty array for no correct position" do
        feedback = Feedback.new(code, "O W P C")
        pegs     = feedback.black_pegs

        pegs.should == []
      end
    end

  end
end