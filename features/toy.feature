Feature: Toy Creation
  In order to create a toy
  A user
  Wants to fill in a form

  Scenario: Fills in a form
    Given the following room:
      | name           | white    |
      | number         | 1        |
      | number_of_toys | 0        |
    Given that I am on the main page
    And I choose one of the rooms
    And I click Add a new toy botton
    And I fill in a form for a new toy
    When I press 'Create Toy'
    Then a new toy should be created
