Feature: Feedback
  When nothing is correct return zero pegs
  When colors are correct return white pegs
  When colors & positions are correct return black pegs
  When duplicate colors are correct only return one peg

  Scenario: When nothing is correct
  Given there is a code "R Y B G"
  When I guess "W O P C"
  Then the feedback should be "- - - -"
