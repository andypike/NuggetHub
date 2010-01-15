Feature: Edit current user account
  In order to keep their details up to date
  a user
  wants to be able to edit their account details

  Scenario Outline: Update the currently logged in user's details
    Given I am a logged in user
      And the username "joe.bloggs" is already in use
      And the email "bo@selecta.com" is already in use
    When I follow "Account"
      And I fill in "Full Name" with "<full_name>"
      And I fill in "Username" with "<username>"
      And I fill in "Email" with "<email>"
      And I fill in "Password" with "<password>"
      And I fill in "Password Confirmation" with "<password_confirmation>"
      And I press "Save Changes"
    Then I should see "<message>"
    
    Examples:
      | full_name  | username   | email                 | password | password_confirmation | message                                         |
      | Andy Pike  | andy.pike  | someone@somewhere.com | secret   | secret                | Your account was successfully updated           |
      |            | andy.pike  | someone@somewhere.com | secret   | secret                | Full name can't be blank                        |
      | Andy Pike  |            | someone@somewhere.com | secret   | secret                | Username can't be blank                         |
      | Andy Pike  | andy.pike  |                       | secret   | secret                | Email can't be blank                            |
      | Andy Pike  | andy.pike  | this is not an email  | secret   | secret                | Email should look like an email address         |
      | Andy Pike  | andy.pike  | someone@somewhere.com |          |                       | Your account was successfully updated           |
      | Andy Pike  | andy.pike  | someone@somewhere.com | secret   |                       | Password doesn't match confirmation             |
      | Andy Pike  | joe.bloggs | someone@somewhere.com | secret   | secret                | Username has already been taken                 |
      | Andy Pike  | andy.pike  | bo@selecta.com        | secret   | secret                | Email has already been taken                    |