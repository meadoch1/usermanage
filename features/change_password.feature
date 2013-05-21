Feature: Change Password
  In order to allow access to the system for a user who has lost his password
  As an Administrator
  I want to change the user's password

  Scenario: Administrator changes a user password
    Given I am an administrator with valid credentials
    When I log into the application and view the user list
    And I click the change password link for a user
    Then I should see the change password screen for that user
    When I input a new password and confirmation password
    And I click the save link
    Then I should return to the user list
    And I should have a flash notification telling me of my success
    And The user's password should be changed in the system

  Scenario: Administrator changes a user password with bad confirmation password
    Given I am an administrator with valid credentials
    When I log into the application and view the user list
    And I click the change password link for a user
    Then I should see the change password screen for that user
    When I input a new password and unmatched confirmation password
    And I click the save link
    Then I should see an error message indicating that the passwords do not match
    And I should still see the change password screen
