Then(/^I can there are "([^"]*)" views on the screen$/) do |value|
  on(SimplePage).all_views.count.should == value
end