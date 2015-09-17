Feature: Write blog post
As a blog user 
I can write a new blog post
  Scenario: Write blog post
    Given I am on the new blog post page
    When I fill "My first post" as Title
    And I fill "This is my first cucumber test" as Body
    And I click "Create Post" button
    Then I should be redirected to the Home page