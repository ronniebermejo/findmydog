module WebStepsHelper

  def current_wizard_step
    page.find(".wizard-steps-menu .active").text
  end

  def click_next_button(label)
    find(:css, ".wizard-next-button", text: label).click
  end

end

World(WebStepsHelper)

Given /^I press "([^"]*)"$/ do |button|
  click_button button
end

Given /^I press "([^"]*)" within "(.*?)"$/ do |button, context|
  within(".#{context}") do
    click_button button
  end
end

Given /^I check "([^"]+)"$/ do |label|
  check(label)
end

Given /^I switch "([^"]+)"$/ do |label|
  find_field(label).click
end

Then %|"$label" should be checked| do |label|
  find(:checkbox, label).should be_checked
end

Then %|"$id" checkbox should be checked| do |id|
  find("##{id}").should be_checked
end

Given /^I uncheck "([^"]+)"$/ do |label|
  uncheck(label)
end

Given /^I fill in "([^"]+)" with "([^"]+)"$/ do |label, content|
  fill_in(label, :with => content)
end

Given /^I fill in "([^"]+)" with "([^"]+)" within "([^"]+)"$/ do |label, content, scope|
  within(".#{scope.downcase}") do
    fill_in(label, :with => content)
  end
end

When /^I fill in the text area "(.*?)" with$/ do |label, content|
  fill_in(label, :with => content.gsub(/\\n/, "\n"))
end

Given /^I clear the "([^"]+)" field$/ do |label|
  fill_in(label, :with => "")
end


Given /^I select "([^"]*)" from "([^"]*)"$/ do |values, label|
  values.split(/,\s*/).each do |value|
    select(value, :from => label)
  end
end

Given /^I select "([^"]*)" from "([^"]*)" within "([^"]*)"$/ do |values, label, scope|
  within(".#{scope.downcase}") do
    values.split(/,\s*/).each do |value|
      select(value, :from => label)
    end
  end
end

When /^I select "(.*?)" "(.*?)" "(.*?)" date from "(.*?)"$/ do |year, month, day, field|
  select year,  from: "#{field}_1i"
  select month, from: "#{field}_2i"
  select day,   from: "#{field}_3i"
end

Given /^I unselect "([^"]*)" from "([^"]*)"$/ do |values, label|
  values.split(/,\s*/).each do |value|
    unselect(value, :from => label)
  end
end

Given /^I choose "(.*?)"$/ do |label|
  choose(label)
end

Then %|"$label" should be selected| do |label|
  find(:radio_button, label).should be_checked
end

Then %|"$option" should be selected in "$label"| do |option, label|
  find(:select, label).should be_checked
end

Then %|"$label" dropdown should contain "$text"|do |label, text|
  page.should have_select(label, options: [text])
end

Given "I am on $page_name" do |page_name|
  visit path_to(page_name)
end

When "I visit $page_name" do |page_name|
  visit path_to(page_name)
end

When /^I (follow|click) "([^"]*)"$/ do |_, link|
  click_link link
end

When /^I (click|follow) "(.*?)" within "(.*?)"$/ do |_, link, context|
  within context do
    click_link link
  end
end

When /^I click the first "(.*?)" link$/ do |link|
  all(:css, "a", text: link).first.click
end

Then /^show me .* page$/ do
  save_and_open_page
end

Then /^I debug$/ do
  require pry; binding.pry
end

Then /^screenshot .* page$/ do
  screenshot_and_open_image
end

Then /^I should be on "([^"]*)"$/ do |path|
  URI.parse(current_url).path.should == path
end

Then "I should be on the $page" do |page|
  URI.parse(current_url).path.should == path_to("the #{page}")
end

Then /^I should be redirected to "([^"]*)"$/ do |path|
  URI.parse(current_url).path.should == path
end

Then /^I should see the button "([^"]*)"$/ do |text|
  page.should have_button(text)
end

Then %|I should see the badge "$badge"| do |badge|
  page.first("span.label", :text => badge.upcase).should_not be_blank
end

Then /^I should not see the button "([^"]*)"$/ do |text|
  page.should_not have_button(text)
end

Then /^I should see the link "([^"]*)"$/ do |text|
  page.should have_link(text)
end

Then /^I should see the link "(.*?)" within "(.*?)"$/ do |text,  context|
  within context do
    page.should have_link(text, exact: true)
  end
end

Then /^I should not see the link "([^"]*)"$/ do |text|
  page.should_not have_link(text, exact: true)
end

Then /^I should not see the link "(.*?)" within "(.*?)"$/ do |text,  context|
  within context do
    page.should_not have_link(text)
  end
end

Then /^I should see "([^"]*)"$/ do |text|
  page.should have_content(text)
end

Then /^I should not see "([^"]*)"$/ do |text|
  page.should_not have_content(text)
end

Then /^I should see a "([^"]*)" action button$/ do |text|
  within ".action_items" do
    page.should have_link(text, exact: true)
  end
end

Then /^I should not see a "([^"]*)" action button$/ do |text|
  within ".action_items" do
    page.should_not have_link(text, exact: true)
  end
end

Given "I refresh the page" do
  visit current_url
end

Then %|I should see error "$error" in "$container"| do |error, container|
  page.find(".control-group.#{container} span.help-inline").text.should == error
end

Then /^I should see "(.*?)" in "(.*?)"$/ do |selected_option, field|
  find_field(field).find('option[selected]').text.should == selected_option
end

Then /^I should not see "(.*?)" in "(.*?)"$/ do |option, field|
  find_field(field).text.should_not include(option)
end

Then /^the "(.*?)" field should not be empty$/ do |field|
  find_field(field).value.should_not be_empty
end

Then /^the "(.*?)" field should be empty$/ do |field|
  find_field(field).value.should be_empty
end

Then /^the "(.*?)" field should be disabled$/ do |field|
  find("##{field}")['disabled'].to_s.should match(/true|disabled/)
end

Then /^I should see the "(.*?)" check$/ do |check_class_name|
  page.should have_css(".#{check_class_name} .icon-ok")
end

Then /^I should see the "(.*?)" x$/ do |check_class_name|
  page.should have_css(".#{check_class_name} .icon-remove")
end

Then %|I should see the modal dialog titled "$title"| do |title|
  modal = page.find(".modal .modal-header h3", text: title)
  modal.should be_visible
end

Given "I wait for the page to refresh" do
  sleep 1
end

When %|the date is "$date"| do |date|
  Timecop.travel(Date.parse(date))
end

Then /^within "(.*?)" I should see "([^"]*)"$/ do |id, text|
  within id do
    page.should have_content(text)
  end
end

Then /^within "(.*?)" I should not see "([^"]*)"$/ do |id, text|
  within id do
    page.should_not have_content(text)
  end
end

When /^I click the last "(.*?)" link$/ do |link|
  all(:css, "a", text: link).last.click
end
