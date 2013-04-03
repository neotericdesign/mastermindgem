Feature: Feedback
  When nothing is correct return zero pegs
  When colors are correct return white pegs

  When duplicate colors are correct only return one peg

  Background:
  Given there is a code "R Y B G"

  Scenario: When nothing is correct
  When I guess "W O P C"
  Then the feedback should be "- - - -"

  Scenario: When colors are correct
  When I guess "Y W R P"
  Then the feedback should be "W W - -"

  Scenario: When color and position are correct
  When I guess "R B W P"
  Then the feedback should be "B W - -"