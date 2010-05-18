Given /^miles travelled since last fill\-up$/ do
  @miles = 200.0
end

Given /^gallons of gas put in$/ do
  @gallons = 11.0
end

Then /^I should be presented with a form to enter this data\.$/ do
  Then 'I should see "Miles since last fillup"'
  Then 'I should see "Gallons"'
end

When /^I fill out the form$/ do
  When('I fill in "Miles since last fillup" with "' + @miles.to_s + '"')
  When('I fill in "Gallons" with "' + @gallons.to_s + '"')
end

When /^I submit the form$/ do
  When 'I press "Save"'
end

Then /^I should see miles travelled \/ gallons put in as my mpg\.$/ do
  Then('I should see "' + (@miles/@gallons).to_s + '"')
end