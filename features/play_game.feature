Feature: Play a game of blackjack
  In order to make money
  a casino will need
  to deal games of blackjack

  Scenario: Player stays and wins
    Given I have $10
    And I bet $10
    And I am dealt a 10
    And I am dealt an 8
    And the dealer is dealt a 10
    And the dealer is dealt a 7
    When the dealer looks at the hands
    Then I should have $20

  Scenario: Player stays and loses
    Given I have $10
    And I bet $10
    And I am dealt a 10
    And I am dealt an 7
    And the dealer is dealt a 10
    And the dealer is dealt a 8
    When the dealer looks at the hands
    Then I should have $0

  Scenario: Player is dealt blackjack  
    Given I have $10
    And I bet $10
    And I am dealt an ace
    And I am dealt a king
    When the dealer looks at the hands
    And I should have $25
