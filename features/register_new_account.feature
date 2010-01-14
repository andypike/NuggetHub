Feature: Register an account
  In order to be able to login and contribute to the site
  a user
  wants to be able to register a new user account
  
  Scenario Outline: Register new account with valid data
    Given I am on the new account page
      And the username "joe.bloggs" is already in use
      And the email "bo@selecta.com" is already in use
    When I fill in "Full Name" with "<full_name>"
      And I fill in "Username" with "<username>"
      And I fill in "Email" with "<email>"
      And I fill in "Password" with "<password>"
      And I fill in "Password Confirmation" with "<password_confirmation>"
      And I press "Join"
    Then I should see "<message>"

    Examples:
      | full_name  | username   | email                 | password | password_confirmation | message                                         |
      | Andy Pike  | andy.pike  | someone@somewhere.com | secret   | secret                | Hello Andy Pike, welcome to NuggetHub.          |
      |            | andy.pike  | someone@somewhere.com | secret   | secret                | Full name can't be blank                        |
      | Andy Pike  |            | someone@somewhere.com | secret   | secret                | Username can't be blank                         |
      | Andy Pike  | andy.pike  |                       | secret   | secret                | Email can't be blank                            |
      | Andy Pike  | andy.pike  | this is not an email  | secret   | secret                | Email should look like an email address         |
      | Andy Pike  | andy.pike  | someone@somewhere.com |          | secret                | Password is too short (minimum is 4 characters) |
      | Andy Pike  | andy.pike  | someone@somewhere.com | secret   |                       | Password doesn't match confirmation             |
      | Andy Pike  | joe.bloggs | someone@somewhere.com | secret   |                       | Username has already been taken                 |
      | Andy Pike  | andy.pike  | bo@selecta.com        | secret   |                       | Email has already been taken                    |