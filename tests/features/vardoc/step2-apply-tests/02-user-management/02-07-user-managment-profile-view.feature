Feature: User Management - User Profile - View
As a visitor with an existing user account
I want to be able to login to the site
So that I will be able to view/add/edit/ or delete content in the site

@javascript @local @development @staging @production
  Scenario: Check if the user has the "Profile page" sections.
    Given I am a logged in user with the "webmaster" user
     When I go to "/user/1"
      And I wait
     Then I should see "Webmaster"
      And I should see "New content"
      And I should see "Favorite content"
     When I click "New content"
      And I wait
     Then I should see "New Content"
     When I go to "/user/1/favorite"
      And I wait
     Then I should see "Favorite content"
