Feature: Product Rating
  As a user,
  I want to rate the products from the product catalog.

  Scenario: Rate the listed products
    Given the products are listed
    And a product is selected to rate
    And in the rating page I enter the email address and rating
    When I click on the "save" button
    Then I am taken back to the product list page and the average rating is updated
