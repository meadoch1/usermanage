### UTILITY METHODS ###

def create_credentials
  @credentials ||= { :name => "Test Admin", :email => "foo@bar.com",
    :password => "admin", :password_confirmation => "admin" }
end

def find_administrator
  @administrator ||= User.where(:email => @administrator[:email]).first
end

def initialize_administrator
  create_credentials
  find_administrator
end

def sign_in
  visit '/users/sign_in'
  fill_in "user_email", :with => @credentials[:email]
  fill_in "user_password", :with => @credentials[:password]
  click_button "Sign in"
end

### STEPS ###
Given(/^I am an administrator with valid credentials$/) do
  initialize_administrator
end

When(/^I am not logged into the application$/) do
  visit '/users/sign_out'
end

When(/^I log into the application and view the user list$/) do
  sign_in
end

When(/^I click the change password link for a user$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I should see the change password screen for that user$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I input a new password and confirmation password$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I click the save link$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I should return to the user list$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I should have a flash notification telling me of my success$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^The user's password should be changed in the system$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I input a new password and unmatched confirmation password$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I should see an error message indicating that the passwords do not match$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I should still see the change password screen$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I click the change roles link for a user$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I should see the change roles screen for that user$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I invert the user's roles$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^The user's roles should display the new settings$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I log into the application$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I should  see the list of system users$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^Users should display their granted roles$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^Users should display in a table$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^Users should have a change password link$/) do
  pending # express the regexp above with the code you wish you had
end
