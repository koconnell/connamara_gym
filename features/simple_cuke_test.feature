Feature: Simple cucumber test

  Scenario: Verify text on the page is correct
    When I visit home
    Then I should see "Listing dummy_records"
