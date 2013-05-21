Feature: Change User Role
  In order to allow user's to access to change over time
  As an Administrator
  I want to change the user's role

  Scenario: Administrator changes a user's role
    Given I am an administrator
    And There are three known users
    When I browse to the site
    And I click the change roles link for a user
    Then I should see the change roles screen for that user
    When I invert the user's roles
    And I click the save link
    Then I should return to the user list
    And I should have a flash notification telling me of my success
    And The user's roles should display the new settings
