Feature: Delete default testing users.

# Normal user: { email: 'test.authenticated@vardot.com', password: 'dD.123123ddd' }
# Editor: { email: 'test.editor@vardot.com', password: 'dD.123123ddd' }
# Content admin: { email: 'test.content_admin@vardot.com', password: 'dD.123123ddd' }
# SEO admin: { email: 'test.seo_admin@vardot.com', password: 'dD.123123ddd' }
# Site admin: { email: 'test.site_admin@vardot.com', password: 'dD.123123ddd' }
# Super admin: { email: 'test.super_admin@vardot.com', password: 'dD.123123ddd' }

  Background:
    Given I am a logged in user with the "webmaster" user

  @javascript @cleanup @tools @local @development @staging
  Scenario: Delete the Normal user user.
     When I go to "/admin/people"
      And I wait
      And I fill in "Normal user" for "Name or email contains"
      And I press "Filter"
      And I wait
     Then I should see "Normal user"
     When I click "Normal user"
      And I wait
     Then I should see "Normal user"
     When I click "Edit my profile"
      And I wait
     Then I should see "Normal user"
     When I press "Cancel account"
      And I wait
     Then I should see "Are you sure you want to cancel the account Normal user?"
     When I select the radio button "Delete the account and its content."
      And I press "Cancel account"
      And I wait
     Then I should see "Normal user has been deleted."

  @javascript @cleanup @tools @local @development @staging
  Scenario: Delete the Editor user.
     When I go to "/admin/people"
      And I wait
      And I fill in "Editor" for "Name or email contains"
      And I press "Filter"
      And I wait
     Then I should see "Editor"
     When I click "Editor"
      And I wait
     Then I should see "Editor"
     When I click "Edit my profile"
      And I wait
     Then I should see "Editor"
     When I press "Cancel account"
      And I wait
     Then I should see "Are you sure you want to cancel the account Editor?"
     When I select the radio button "Delete the account and its content."
      And I press "Cancel account"
      And I wait
     Then I should see "Editor has been deleted."

  @javascript @cleanup @tools @local @development @staging
  Scenario: Delete the Content admin user.
     When I go to "/admin/people"
      And I fill in "Content admin" for "Name or email contains"
      And I press "Filter"
      And I wait
     Then I should see "Content admin"
     When I click "Content admin"
      And I wait
     Then I should see "Content admin"
     When I click "Edit my profile"
      And I wait
     Then I should see "Content admin"
     When I press "Cancel account"
      And I wait
     Then I should see "Are you sure you want to cancel the account Content admin?"
     When I select the radio button "Delete the account and its content."
      And I press "Cancel account"
      And I wait
     Then I should see "Content admin has been deleted."

  @javascript @cleanup @tools @local @development @staging
  Scenario: Delete the SEO admin user.
     When I go to "/admin/people"
      And I wait
      And I fill in "SEO admin" for "Name or email contains"
      And I press "Filter"
      And I wait
     Then I should see "SEO admin"
     When I click "SEO admin"
      And I wait
     Then I should see "SEO admin"
     When I click "Edit my profile"
      And I wait
     Then I should see "SEO admin"
     When I press "Cancel account"
      And I wait
     Then I should see "Are you sure you want to cancel the account SEO admin?"
     When I select the radio button "Delete the account and its content."
      And I press "Cancel account"
      And I wait
     Then I should see "SEO admin has been deleted."

  @javascript @cleanup @tools @local @development @staging
  Scenario: Delete the Site admin user.
     When I go to "/admin/people"
      And I wait
      And I fill in "Site admin" for "Name or email contains"
      And I press "Filter"
      And I wait
     Then I should see "Site admin"
     When I click "Site admin"
      And I wait
     Then I should see "Site admin"
     When I click "Edit my profile"
      And I wait
     Then I should see "Site admin"
     When I press "Cancel account"
      And I wait
     Then I should see "Are you sure you want to cancel the account Site admin?"
     When I select the radio button "Delete the account and its content."
      And I press "Cancel account"
      And I wait
     Then I should see "Site admin has been deleted."

  @javascript @cleanup @tools @local @development @staging
  Scenario: Delete the Super admin user.
     When I go to "/admin/people"
      And I wait
      And I fill in "Super admin" for "Name or email contains"
      And I press "Filter"
      And I wait
     Then I should see "Super admin"
     When I click "Super admin"
      And I wait
     Then I should see "Super admin"
     When I click "Edit my profile"
      And I wait
     Then I should see "Super admin"
     When I press "Cancel account"
      And I wait
     Then I should see "Are you sure you want to cancel the account Super admin?"
     When I select the radio button "Delete the account and its content."
      And I press "Cancel account"
      And I wait
     Then I should see "Super admin has been deleted."
