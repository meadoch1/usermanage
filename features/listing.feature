Feature: Listing
  In order to maintain system users
  As an Administrator
  I want to see a list of system users

  Scenario: Administrator views the user list
    Given I am an administrator
    And There are three known users
    When I browse to the site
    Then I should  see the list of system users
    And Users should display their granted roles
    And Users should display in a table
    And Users should have a change password link
