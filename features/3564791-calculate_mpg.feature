@http://www.pivotaltracker.com/story/show/3564791
Feature: Calculate MPG
  In order to proactively diagnose engine problems
  As a driver
  I want to monitor my average miles per gallon.

  Scenario: Enter data
  Given miles travelled since last fill-up
  And gallons of gas put in
  When I go to the input page
  Then I should be presented with a form to enter this data.

  Scenario: Calculate miles per gallon
  Given I am on the input page
  And miles travelled since last fill-up
  And gallons of gas put in
  When I fill out the form
  And I submit the form
  Then I should see miles travelled / gallons put in as my mpg.
