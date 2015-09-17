Given(/^I am on the new blog post page$/) do
  visit("/posts/new")
end

When(/^I fill "(.*?)" as Title$/) do |title|
  @title = title
  fill_in "Title", :with => title
end

When(/^I fill "(.*?)" as Body$/) do |body|
  @body = body
  fill_in "Body", :with => body
end

When(/^I click "(.*?)" button$/) do |btn|
  click_button btn
end

Then(/^I should be redirected to the Home page$/) do
  expect(page).to have_content(@title)
end