Feature: player submits guess

  The player submits a guess trying to match the 
  name of the card shown, if it matches, the result
  will be "correct" if it doesn't match, the result 
  will be "wrong"

  Scenario Outline: submit matches
    Given the name of the card is "<name>"
    When I guess "<guess>"
    Then the resuld should be "<result>"

    Scenarios: no match
      | name | guess | result   |
      | dog  | wolf  | wrong    |
      | cat  | tiger | wrong    |

    Scenarios: match
      | name | guess | result   |
      | dog  | dog   | correct  |
      | cat  | cat   | correct  |
