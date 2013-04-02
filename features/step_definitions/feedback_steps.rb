class Feedback
  def initialize(code, guess)
  end

  def pegs
    "- - - -"
  end
end


Given(/^there is a code "(.*?)"$/) do |code|
  @code = code
end

When(/^I guess "(.*?)"$/) do |guess|
  @guess = guess
end

Then(/^the feedback should be "(.*?)"$/) do |feedback|
  guess_feedback = Feedback.new(@code, @guess)
  guess_feedback.pegs.should == feedback
end