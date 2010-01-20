Feature: Edit current user account
  In order to keep their details up to date
  an account holder
  wants to be able to edit their account details

  Scenario Outline: Update the currently logged in user's details
    Given I am a logged in user
      And the username "joe_bloggs" is already in use
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
      | Andy Pike  | andy_pike  | someone@somewhere.com | secret   | secret                | Your account was successfully updated           |
      |            | andy_pike  | someone@somewhere.com | secret   | secret                | Full name can't be blank                        |
      | Andy Pike  |            | someone@somewhere.com | secret   | secret                | Username can't be blank                         |
      | Andy Pike  | andy_pike  |                       | secret   | secret                | Email can't be blank                            |
      | Andy Pike  | andy_pike  | this is not an email  | secret   | secret                | Email should look like an email address         |
      | Andy Pike  | andy_pike  | someone@somewhere.com |          |                       | Your account was successfully updated           |
      | Andy Pike  | andy_pike  | someone@somewhere.com | secret   |                       | Password doesn't match confirmation             |
      | Andy Pike  | joe_bloggs | someone@somewhere.com | secret   | secret                | Username has already been taken                 |
      | Andy Pike  | andy_pike  | bo@selecta.com        | secret   | secret                | Email has already been taken                    |
      | Andy Pike  | 123&£$ gdh | bo@selecta.com        | secret   | secret                | Username can only contain letters, numbers, underscores and hyphens. Must be between 3 and 16 characters long |

  Scenario: Disallow access if the user is not logged in
    Given I am not a registered user
    When I go to the edit current account page
    Then I should see "You are not authorized to access this page"
