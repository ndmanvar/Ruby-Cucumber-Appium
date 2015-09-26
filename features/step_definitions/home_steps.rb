Given /^I enter "(.*)" into text field with accessibility id "(.*)"$/ do | text, accessibility_id |
  @driver.find_element(:accessibility_id, accessibility_id).send_keys text
end
