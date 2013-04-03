Feature: Feedback
  When nothing is correct return zero pegs
  When colors are correct return white pegs

  When duplicate colors are correct only return one peg

  Background:
  Given there is a code "R Y B R"

  Scenario: When nothing is correct
    When I guess "W O P C"
    Then the feedback should be "- - - -"

  Scenario: When some colors are correct
    When I guess "Y W R P"
    Then the feedback should be "W W - -"

  Scenario: When guess is correct
    When I guess "R Y B R"
    Then the feedback should be "B B B B"

  Scenario: When color and position are correct
    When I guess "C Y R C"
    Then the feedback should be "B W - -"
    When I guess "R O C Y"
    Then the feedback should be "B W - -"

  Scenario: When there are duplicate colors
    When I guess "Y Y Y Y"
    Then the feedback should be "B - - -"
    When I guess "R Y Y R"
    Then the feedback should be "B B B -"
    When I guess "R R R R"
    Then the feedback should be "B B - -"
    When I guess "R O R Y"
    Then the feedback should be "B W - -"
    When I guess "R B R Y"
    Then the feedback should be "B W W -"