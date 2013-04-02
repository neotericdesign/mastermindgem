Given(/^there is a code "(.*?)"$/) do |code|
  @code = code
end

When(/^I guess "(.*?)"$/) do |guess|
  @guess = guess
end

Then(/^the feedback should be "(.*?)"$/) do |feedback|
  guess_feedback = Mastermind::Feedback.new(@code, @guess)
  guess_feedback.pegs.should == feedback
end

