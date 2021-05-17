Feature: Content Structure - Tools.
As a logged in user with a permission to mange Toolss
I want to be able to add a "Tools" to the site with a fixed layout
So that the "Tools" will show up in the structured menu under its parent page

# Check if users with the ( "authenticated user", "Editor", "Content Admin",
# "Site Admin", or "Super Admin" ) role can add [Tools]

  @javascript @local @development @staging @production
  Scenario: Check if [authenticated user] can add content of "Tools" type.
    Given I am a logged in user with the "test_authenticated" user
     When I go to "/node/add"
      And I wait
     Then I should not see "Tools"

  @javascript @local @development @staging @production
  Scenario: Check if [Editor] can add content of "Tools" type.
    Given I am a logged in user with the "test_editor" user
     When I go to "/node/add"
      And I wait
     Then I should not see "Tools"

  @javascript @local @development @staging @production
  Scenario: Check if [Content Admin] can add content of "Tools" type.
    Given I am a logged in user with the "test_content_admin" user
     When I go to "/node/add"
      And I wait
     Then I should see "Tools"

  @javascript @local @development @staging @production
  Scenario: Check if [Site Admin] can add content of "Tools" type.
    Given I am a logged in user with the "test_site_admin" user
     When I go to "/node/add"
      And I wait
     Then I should see "Tools"

  @javascript @local @development @staging @production
  Scenario: Check if [Super Admin] can add content of "Tools" type.
    Given I am a logged in user with the "test_super_admin" user
     When I go to "/node/add"
      And I wait
     Then I should see "Tools"
