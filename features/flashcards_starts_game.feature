Feature: flash-cards starts game

  As a player
  I want to start the game
  So I can start guessing the name of the cards

  Scenario: start game
    Given I am not yet playing
    When I start a new game
    Then I should see "Welcome to Flash Cards!"
