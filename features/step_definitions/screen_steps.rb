Then(/^I can find the view data for the view marked "([^"]*)"$/) do |label|
  on(SimplePage).view_by_label(label).nil? == false
end