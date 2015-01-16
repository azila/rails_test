Given(/^that I am on the main page$/) do
  visit '/'
end

Given(/^I choose one of the rooms$/) do
  click_link('Show')
end

Given(/^I click Add a new toy botton$/) do
  click_link('Add a new toy')
end

Given(/^I fill in a form for a new toy$/) do
  fill_in('toy_name', with: 'Lego')
  fill_in('toy_color', with: 'different')
  fill_in('toy_price', with: '99.99')
  fill_in('toy_available_num', with: '10')
end

When(/^I press 'Create Toy'$/) do
  click_button('Create Toy')
end

Then(/^a new toy should be created$/) do
  expect(page).to have_content('Lego')
  expect(page).to have_content('Toy was successfully created.')
end
