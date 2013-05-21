### UTILITY METHODS ###

def create_credentials
  @credentials ||= { :name => "Test Admin", :username => "testadmin",
    :password => "mypass", :password_confirmation => "mypass" }
end

def create_administrator
  @administrator = User.create @credentials
end

def destroy_administrator
  find_administrator
  @administrator.destroy if @administrator
end

def find_administrator
  @administrator ||= User.where(:username => @credentials[:username]).first
end

def initialize_administrator
  create_credentials
  destroy_administrator
  create_administrator
end

def create_user_credentials
  unless @user_credentials
    @user_credentials = []
    3.times do |i|
      @user_credentials << { :name =>  "TestUser", :username => "testuser#{i}",
        :password => "mypass", :password_confirmation => "mypass" }
    end
  end
end

def create_users
  @users = @user_credentials.map {|user_cred| User.create user_cred}
end

def destroy_users
  User.destroy_all
  @users = nil
  @administrator = nil
end

def find_users
  @users ||= User.where(:name => @user_credentials[0][:name]).all
end

def initialize_users
  destroy_users
  initialize_administrator
  create_user_credentials
  create_users
end

def browse_to_home
  visit '/'
end

### STEPS ###
Given(/^I am an administrator$/) do
  initialize_administrator
end

Given(/^There are three known users$/) do
  initialize_users
end

When(/^I browse to the site$/) do
  browse_to_home
end

Then(/^I should  see the list of system users$/) do
  find('td', text: 'testuser0').should_not be_nil
  find('td', text: 'testuser1').should_not be_nil
  find('td', text: 'testuser2').should_not be_nil
end

Then(/^Users should display their granted roles$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^Users should display in a table$/) do
  find('table').should_not be_nil
end

Then(/^Users should have a change password link$/) do
  find(:xpath, "//tr[contains(.,'testuser1')]/td/a", :text => 'Change password').should_not be_nil
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
  find(:xpath, "//tr[contains(.,'testuser1')]/td/a", :text => 'Edit roles').click
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

