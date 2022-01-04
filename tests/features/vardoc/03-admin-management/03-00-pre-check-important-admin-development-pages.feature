Feature: Pre-check important administrator and development pages.
As a site admin user
I want to be able to make sure that all admin and development tools are working
So that I can use them after the install or update.

  @javascript @local @development @staging @production
  Scenario: Check the content page.
    Given I am a logged in user with the "webmaster" user
     When I go to "/admin/content"
      And I wait
     Then I should see "Content"

  @javascript @local @development @staging @production
  Scenario: Check the structure page.
    Given I am a logged in user with the "webmaster" user
     When I go to "/admin/structure"
      And I wait
     Then I should see "Block layout"
      And I should see "Content types"
      And I should see "Display Suite"
      And I should see "Display modes"
      And I should see "Entityqueues"
      And I should see "Media types"
      And I should see "Menu position rules"
      And I should see "Menus"
      And I should see "Pages"
      And I should see "Taxonomy"
      And I should see "Views"
      And I should see "Webforms"

  @javascript @local @development @staging @production
  Scenario: Check the structure page.
    Given I am a logged in user with the "webmaster" user
     When I go to "/admin/structure/page_manager"
      And I wait
     Then I should see "Pages"
      And I should see "Homepage"
      And I should see "Total Control dashboard"

  @javascript @local @development @staging @production
  Scenario: Check the Page Manager main page.
    Given I am a logged in user with the "webmaster" user
     When I go to "/admin/structure/page_manager"
      And I wait
     Then I should see "Pages"
      And I should see "Homepage"
      And I should see "Total Control dashboard"

  @javascript @local @development @staging @production
  Scenario: Check the views page.
    Given I am a logged in user with the "webmaster" user
     When I go to "/admin/structure/views"
      And I wait
     Then I should see "Views"
      And I should see "Browser"

  @javascript @local @development @staging @production
  Scenario: Check the Appearance page.
    Given I am a logged in user with the "webmaster" user
     When I go to "/admin/appearance"
      And I wait
     Then I should see "Appearance"
      And I should see "Vartheme"
      And I should see "Vardoc Theme"
      And I should see "Adminimal"
      And I should see "Bootstrap"
      And I should see "Vartheme Admin"
