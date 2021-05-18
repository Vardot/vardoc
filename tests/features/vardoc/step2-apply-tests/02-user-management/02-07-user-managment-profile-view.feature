Feature: User Management - User Profile - View
As a visitor with an existing user account
I want to be able to login to the site
So that I will be able to view/add/edit/ or delete content in the site

@javascript @local @development @staging @production
  Scenario: Check if the webmaster user has the "Profile page" sections.
    Given I am a logged in user with the "webmaster" user
     When I go to "/user/1"
      And I wait
     Then I should see "Vardoc Webmaster"
      And I should see "New content"
      And I should see "Favorite content"
     When I click "New content"
      And I wait
     Then I should see "New Content"
     When I go to "/user/1/favorite"
      And I wait
     Then I should see "Favorite content"

  @javascript @local @development @staging @production
  Scenario: Check that authenticated users have the "Profile page" sections.
    Given I am a logged in user with the "test_authenticated" user
     When I go to "/user"
      And I wait
     Then I should see "test_authenticated"
      And I should see "Authenticated Test"
      And I should see "New content"
      And I should see "Favorite content"
      And I should see "Edit my profile"

  @javascript @local @development @staging @production
  Scenario: Check that Editor users have the "Profile page" sections.
    Given I am a logged in user with the "test_editor" user
     When I go to "/user"
      And I wait
     Then I should see "test_editor"
      And I should see "Editor Test"
      And I should see "New content"
      And I should see "Favorite content"
      And I should see "Edit my profile"

  @javascript @local @development @staging @production
  Scenario: Check that Content Admin users have the "Profile page" sections.
    Given I am a logged in user with the "test_content_admin" user
     When I go to "/user"
      And I wait
     Then I should see "test_content_admin" 
      And I should see "Content Admin Test"
      And I should see "New content"
      And I should see "Favorite content"
      And I should see "Edit my profile"

  @javascript @local @development @staging @production
  Scenario: Check that Site Admin users have the "Profile page" sections.
    Given I am a logged in user with the "test_site_admin" user
     When I go to "/user"
      And I wait
     Then I should see "test_site_admin"
      And I should see "Site Admin Test"
      And I should see "New content"
      And I should see "Favorite content"
      And I should see "Edit my profile"

  @javascript @local @development @staging @production
  Scenario: Check that Super admin users have the "Profile page" sections.
    Given I am a logged in user with the "test_super_admin" user
     When I go to "/user"
      And I wait
     Then I should see "test_super_admin"
      And I should see "Super Admin Test"
      And I should see "New content"
      And I should see "Favorite content"
      And I should see "Edit my profile"