Feature: Merge Articles
  As an admin
  In order to remove dupilicated articles
  I want to merge articles

  Background:
    Given the blog is set up
    And the following articles exist:
    | author | title     | body      | id | published | type    |
    | alice  | Article 1 | Content 1 | 2  | true      | Article |
    | bob    | Article 2 | Content 2 | 3  | true      | Article |

  Scenario: A non-admin cannot merge articles.
    Given I am logged as 'alice' with password 'alice'
    When I follow "All Articles"
    Then I should see " Article 1"
    When I follow "Article 1"
    Then I should not see "Merge"
    Then I should see "Article 1"

    Scenario: An admin can merge two articles into one
      Given I am logged into the admin panel
      And I follow "All Articles"
      And I follow "Article 1"
      And I fill in "merge_with" with "3"
      And I press "Merge"
      Then I should see "Successfully merged"
      When I go to the home page
      Then I should see "Article 2"
      And I should not see "Article 1"
