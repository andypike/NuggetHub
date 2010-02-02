Feature: Comment on Nuggets
  In order to share their thoughts of a particular nugget of information
  an account holder
  wants to be able to create and edit their comments of a nugget

  Scenario: Allow a logged in user to comment on any nugget
    Given I am a logged in user
      And there is a nugget entitled "Comment on me" with body "This nugget needs comments"
    When I fill in "comment_text" with "This is what I think of your nugget"
      And I press "Post Comment"
    Then I should see "Your comment was successfully posted"
    
  Scenario: A unauthenticated user should not be able to post comments
    Given I am not a registered user
      And there is a nugget entitled "Comment on me" with body "This nugget needs comments"
    Then I should not see "Post Comment"

  Scenario: A user should be able to see a list of comments posted against a nugget
    Given I am a logged in user
      And there is a nugget entitled "Comment on me" with body "This nugget needs comments" a comment "This is my comment"
    Then I should see "This is my comment"

  Scenario: A user should see a message if there are no comments for a nugget
    Given I am not a registered user
      And there is a nugget entitled "Comment on me" with body "This nugget needs comments"
    Then I should see "Be the first to comment on this nugget"
    