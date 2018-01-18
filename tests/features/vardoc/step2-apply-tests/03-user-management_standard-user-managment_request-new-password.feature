Feature: User Management - Standard User Management - Request new password
As a user with a ready user account
I will want to be able to Request new password
So that I can reset my password for the account

  Background:
    Given I am not logged in

  @local @development @staging @production
  Scenario: Check that an anonymous user can reset his/her password.
     When I go to "/user/login"
      And I wait
     Then I should see "Forgot your password?"
