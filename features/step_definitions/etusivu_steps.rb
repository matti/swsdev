
When /^I get "([^"]*)"$/ do |url|
  visit url
end

Given /^database is empty$/ do
  DatabaseCleaner.clean
end
