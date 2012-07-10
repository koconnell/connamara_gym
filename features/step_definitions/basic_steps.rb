When /^I visit (.*)\s*$/ do |uri|
  visit "/#{uri}"
  sleep 0.5
end

Then /^I should see "([^"]*)"\s*$/ do |text|
  page.should have_content(text)
end

Then /^I pause "([^"]*)" seconds$/ do |tm_sec|
  puts ">>> sleeping #{tm_sec} <<<"
  sleep tm_sec.to_i
end
