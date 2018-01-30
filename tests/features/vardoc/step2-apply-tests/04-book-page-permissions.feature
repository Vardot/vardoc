Feature: Content Structure - Article (Book page)
As a logged in user with a permission to manage Article (Book page).
I want to be able to add a "Book page" which has got predefined set of fields
So that the "Book page" will show up in the structured menu under its parent page

  @javascript @local @development @staging @production
  Scenario: Check if we do have the "Book page" content type.
    Given I am a logged in user with the "webmaster" user
     When I go to "/admin/structure/types"
      And I wait
     Then I should see "Article (Book page)"

  @javascript @local @development @staging @production
  Scenario: Check that "Article (Book page)" type have a the book fields.
    Given I am a logged in user with the "webmaster" user
     When I go to "/admin/structure/types/manage/book/fields"
      And I wait
      Then I should see "Body"
      And I should see "Category"
      And I should see "Comment"
      And I should see "Content rating"
      And I should see "Documents"
      And I should see "External links"
      And I should see "Meta tags"

  @javascript @local @development @staging @production
  Scenario: Check that Anonymous users can not create an Article (Book page).
    Given I am an anonymous user
     When I go to "/node/add/book"
      And I wait
     Then I should see "Access denied"
      And I should see "You are not authorized to access this page."

  @javascript @local @development @staging @production
  Scenario: Check that authenticated users can not create an Article (Book page).
    Given I am a logged in user with the "test_authenticated" user
     When I go to "/node/add/book"
      And I wait
     Then I should see "Access denied"
      And I should see "You are not authorized to access this page."

  @javascript @local @development @staging @production
  Scenario: Check that Editor users can create an Article (Book page).
    Given I am a logged in user with the "test_editor" user
     When I go to "/node/add/book"
      And I wait
     Then I should not see "Access denied"
      And I should not see "You are not authorized to access this page."

  @javascript @local @development @staging @production
  Scenario: Check that Content Admin users can create an Article (Book page).
    Given I am a logged in user with the "test_content_admin" user
     When I go to "/node/add/book"
      And I wait
     Then I should not see "Access denied"
      And I should not see "You are not authorized to access this page."

  @javascript @local @development @staging @production
  Scenario: Check that Site Admin users can create an Article (Book page).
    Given I am a logged in user with the "test_site_admin" user
     When I go to "/node/add/book"
      And I wait
     Then I should not see "Access denied"
      And I should not see "You are not authorized to access this page."