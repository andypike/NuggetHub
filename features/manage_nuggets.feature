Feature: Manage personal nuggets
  In order to share their nuggets of information
  an account holder
  wants to be able to create, edit and delete their own nuggets
  
  Scenario: Allow the current user to create a new nugget
    Given I am a logged in user
    When I follow "Add a Nugget"
      And I fill in "Title" with "How to close an application on OSX"
      And I fill in "Body" with "CMD-Q"
      And I press "Post Nugget"
    Then I should see "Your Nugget was successfully posted"
      And I should see "How to close an application on OSX"

  Scenario: Allow the current user to edit their own nuggets
    Given I am a logged in user
      And I am viewing a nugget that I have created
    When I follow "Edit"
      And I fill in "Title" with "Just edited the title"
      And I press "Save changes"
    Then I should see "Your Nugget was successfully updated"
      And I should see "Just edited the title"

  Scenario: Allow an admin user to edit any nugget
    Given I am a logged in admin user
      And there is a nugget entitled "Original title" with body "Original body"
    When I follow "Edit"
      And I fill in "Title" with "Just edited the title"
      And I press "Save changes"
    Then I should see "Your Nugget was successfully updated"
      And I should see "Just edited the title"

  Scenario: Do not allow an unauthenticated user edit a nugget
    Given I am not a registered user
      And there is a nugget entitled "Original title" with body "Original body"
    Then I should not see "Edit"
