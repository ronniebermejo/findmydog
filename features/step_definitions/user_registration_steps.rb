
Given /I provide my data to get registered as a user/ do

  click_link 'Login'
  click_link 'Sign up'
  fill_in 'user_email', :with => 'ronnie.bermejo.mx@gmail.com'
  fill_in 'user_password', :with => 'ronnie_bermejo'
  fill_in 'user_password_confirmation', :with => 'ronnie_bermejo'
  click_button 'Sign up'

end

Then /I should be logged in/ do
  step %|I should see the link "Logout"|
end

