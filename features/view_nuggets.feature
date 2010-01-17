Feature: View existing nuggets
  In order to learn new things from other peoples nuggets
  a user
  wants to be able to see the full details of a nugget

  Scenario: Allow an unauthenticated user to view a nugget
    Given there is a nugget entitled "How to close an application on OSX" with body "CMD-Q"
      And I am on the home page
    When I follow "How to close an application on OSX"
    Then I should see "How to close an application on OSX"
      And I should see "CMD-Q"