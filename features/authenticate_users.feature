Feature: Authenticate Users
  In order to be able to contribute to the site
  an account holder
  wants to be able to login

  Scenario: Successful login
    Given I have an existing user account with the username of andy_pike
      And I am on the login page
    When I fill in "Username" with "andy_pike"
      And I fill in "Password" with "secret"
      And I press "Login"
    Then I should see "Welcome back to NuggetHub."

  Scenario: Unsuccessful login
    Given I am not a registered user
      And I am on the login page
    When I fill in "Username" with "a guess"
      And I fill in "Password" with "wrong password"
      And I press "Login"
    Then I should see "Username/Password combination is not valid"

  Scenario: Successful logout
    Given I am a logged in user
    When I follow "Logout"
    Then I should see "You have been successfully logged out."

