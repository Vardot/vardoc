Feature: Content Structure - Homepage Permissions with Landing Pages with Layout Builder
As a logged in user with a permission to manage Landing (Layout Builder) pages.
I want to be able to edit the page layouts sections and blocks
So that the homepage can be changed with permission in an easy way and be sure it will not deleted.

  @javascript @local @development @staging @production
  Scenario: Check that user Number 1 can see and have all options to edit the Homepage which built by the Landing page (Layout Builder)
    Given I am a logged in user with the "webmaster" user
     When I go to the homepage
      And I wait
     Then I should see "Need help finding something?"
      And I should see "Can’t find what you’re looking for?"
     When I click "Tasks"
      And I wait for AJAX to finish
      And I wait 2s
      And I should see "Edit content"
      And I should see "Delete"
      And I should see "Manage display"
      And I should see "Layout"
      And I should see "Revisions"
      And I should see "Devel"
      And I should see "Clone"

  @javascript @local @development @staging @production
  Scenario: Check that an anonymous users can only see the Homepage which built by the Landing page (Layout Builder)
    Given I am an anonymous user
     When I go to the homepage
      And I wait
     Then I should see "Need help finding something?"
      And I should see "Can’t find what you’re looking for?"
      And I should not see "Tasks"
      And I should not see "Edit content"
      And I should not see "Delete"
      And I should not see "Manage display"
      And I should not see "Layout" in the "a" element with the "class" attribute set to "moderation-sidebar-link button"
      And I should not see "Revisions"
      And I should not see "Devel"
      And I should not see "Clone"

  @javascript @local @development @staging @production
  Scenario: Check that an authenticated user can not edit the Homepage which built by the Landing page (Layout Builder)
    Given I am a logged in user with the "test_authenticated" user
     When I go to the homepage
      And I wait
     Then I should see "Need help finding something?"
      And I should see "Can’t find what you’re looking for?"
      And I should not see "Tasks"
      And I should not see "Edit content"
      And I should not see "Delete"
      And I should not see "Manage display"
      And I should not see "Layout" in the "a" element with the "class" attribute set to "moderation-sidebar-link button"
      And I should not see "Revisions"
      And I should not see "Devel"
      And I should not see "Clone"

  @javascript @local @development @staging @production
  Scenario: Check that Editor users can edit the Homepage which built by the Landing page (Layout Builder)
    Given I am a logged in user with the "test_editor" user
     When I go to the homepage
      And I wait
     Then I should see "Need help finding something?"
      And I should see "Can’t find what you’re looking for?"
     When I click "Tasks"
      And I wait for AJAX to finish
      And I should see "Edit content"
      And I should not see "Delete"
      And I should not see "Manage display"
      And I should see "Layout"
      And I should see "Revisions"
      And I should not see "Devel"
      And I should not see "Clone"

  @javascript @local @development @staging @production
  Scenario: Check that Content Admin users can edit the Homepage which built by the Landing page (Layout Builder)
    Given I am a logged in user with the "test_content_admin" user
     When I go to the homepage
      And I wait
     Then I should see "Need help finding something?"
      And I should see "Can’t find what you’re looking for?"
     When I click "Tasks"
      And I wait for AJAX to finish
      And I should see "Edit content"
      And I should not see "Delete"
      And I should not see "Manage display"
      And I should see "Layout"
      And I should see "Revisions"
      And I should not see "Devel"
      And I should see "Clone"

  @javascript @local @development @staging @production
  Scenario: Check that SEO Admin users can edit the Homepage which built by the Landing page (Layout Builder)
    Given I am a logged in user with the "test_seo_admin" user
     When I go to the homepage
      And I wait
     Then I should see "Need help finding something?"
      And I should see "Can’t find what you’re looking for?"
     When I click "Tasks"
      And I wait for AJAX to finish
      And I should see "Edit content"
      And I should not see "Delete"
      And I should not see "Manage display"
      And I should not see "Layout" in the "a" element with the "class" attribute set to "moderation-sidebar-link button"
      And I should see "Revisions"
      And I should not see "Devel"
      And I should not see "Clone"

  @javascript @local @development @staging @production
  Scenario: Check that Site Admin users can edit the Homepage which built by the Landing page (Layout Builder)
    Given I am a logged in user with the "test_site_admin" user
     When I go to the homepage
      And I wait
     Then I should see "Need help finding something?"
      And I should see "Can’t find what you’re looking for?"
     When I click "Tasks"
      And I wait for AJAX to finish
      And I should see "Edit content"
      And I should not see "Delete"
      And I should not see "Manage display"
      And I should see "Layout"
      And I should see "Revisions"
      And I should not see "Devel"
      And I should see "Clone"
