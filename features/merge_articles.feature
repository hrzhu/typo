Feature: Merge Articles
  As an admin
  In order to remove dupilicated articles
  I want to merge articles

  Background:
    Given the blog is set up
    And the following articles exist:
    | author | title     | body      | id | published |
    | alice  | Article 1 | Content 1 | 5  | true      |
    | bob    | Article 2 | Contnet 2 | 6  | true      |

  Scenario: A non-admin cannot merge articles.
    Given I am logged as 'alice' with password 'alice'
    When I follow "All Articles"
    Then I should see " Article 1"
    When I follow "Article 1"
    Then I should not see "Merge"
    Then I should see "Article 1"
