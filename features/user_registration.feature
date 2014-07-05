@javascript

Feature: User registration

Scenario: As a guest I want to get an account so that I can open a report.

  Given I am on "home"
  And I provide my data to get registered as a user
  Then I should be logged in
