Feature: User Management - Standard User Management - Admins can disable users
As a site admin user
I want to be able Block user accounts
So that they will be disabled and not be able to use the site.

  @javascript @local @development @staging @production
  Scenario: Check if the Normal user user is not blocked and can login
    Given I am on "user/login"
      And I wait
     When I fill in "Normal user" for "Username"
      And I fill in "dD.123123ddd" for "Password"
      And I press "Log in"
      And I wait
     Then I should see "Normal user"

  @javascript @local @development @staging @production
  Scenario: Check if the site admin can Administer users and disable a User account Normal user from accessing the site
    Given I am a logged in user with the "Site admin" user
     When I go to "/admin/people"
      And I wait
     Then I should see "People"
     When I fill in "Normal user" for "Name or email contains"
      And I press "Filter"
      And I wait
     Then I should see "Normal user"
     When I click "Edit" in the "Normal user" row
      And I wait
     Then I should see "Normal user"
     When I fill in "Normal user" for "First name"
      And I fill in "Vardot" for "Last name"
      And I select the radio button "Blocked"
      And I press "Save"
      And I wait
     Then I should see "The changes have been saved."

  @javascript @local @development @staging @production
  Scenario: Check if the blocked user with user id of Test Blocked User ID can or can not login
    Given I am on "user/login"
      And I wait
     When I fill in "Normal user" for "Username"
      And I fill in "dD.123123ddd" for "Password"
      And I press "Log in"
      And I wait
     Then I should see "The username Normal user has not been activated or is blocked."

  @javascript @local @development @staging @production
  Scenario: Check if the site admin can Administer users and disable a User account Normal user from accessing the site
    Given I am a logged in user with the "Site admin" user
     When I go to "/admin/people"
      And I wait
     Then I should see "People"
     When I fill in "Normal user" for "Name or email contains"
      And I press "Filter"
      And I wait
     Then I should see "Normal user"
     When I click "Edit" in the "Normal user" row
      And I wait
     Then I should see "Normal user"
     When I select the radio button "Active"
      And I press "Save"
      And I wait
     Then I should see "The changes have been saved."

  @javascript @local @development @staging @production
  Scenario: Check if the Normal user user is active and can login again
    Given I am on "user/login"
      And I wait
     When I fill in "Normal user" for "Username"
      And I fill in "dD.123123ddd" for "Password"
      And I press "Log in"
      And I wait
     Then I should see "Normal user"