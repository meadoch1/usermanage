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

def flag_by_index(flag, index)
  @settings ||= { :admin => [true, false, false], :supervisor => [false, true, false], :csr => [false, false, true]}
  @settings[flag][index]
end

  

def create_user_credentials
  unless @user_credentials
    @user_credentials = []
    3.times do |i|
      @user_credentials << { :name =>  "TestUser", :username => "testuser#{i}",
        :password => "mypass", :password_confirmation => "mypass",
        :admin => flag_by_index(:admin,i), :supervisor => flag_by_index(:supervisor,i), :csr => flag_by_index(:csr,i) }
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

def first_user_password_change_link
  find("a[href='/users/#{@users.first.id}/edit_password']")
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
  @users.each_with_index do |user, index|
    has_css?("div##{user.id}_admin.icon-ok").should == flag_by_index(:admin,index)
    has_css?("div##{user.id}_supervisor.icon-ok").should == flag_by_index(:supervisor,index)
    has_css?("div##{user.id}_csr.icon-ok").should == flag_by_index(:csr,index)
  end
  
end

Then(/^Users should display in a table$/) do
  find('table').should_not be_nil
end

Then(/^Users should have a change password link$/) do
  first_user_password_change_link.should_not be_nil
end

When(/^I click the change password link for a user$/) do
  @last_user_clicked = @users.first
  first_user_password_change_link.click
end

Then(/^I should see the change password screen for that user$/) do
  current_url.should == edit_user_password_url(@last_user_clicked)
end

When(/^I input a new password and confirmation password$/) do
  fill_in 'user_password', :with => "newpass"
  fill_in 'user_password_confirmation', :with => "newpass"
end

When(/^I click the save link$/) do
  click_button 'Update User'
end

Then(/^I should return to the user list$/) do
  current_url.should == users_url
end

Then(/^I should have a flash notification telling me of my success$/) do
  text.should match(/User was successfully updated./)
end

Then(/^The user's password should be changed in the system$/) do
  old_digest = @last_user_clicked.password_digest
  refreshed_user = User.find(@last_user_clicked.id)
  refreshed_user.password_digest.should_not == old_digest
end

When(/^I input a new password and unmatched confirmation password$/) do
  fill_in 'user_password', :with => "newpass"
  fill_in 'user_password_confirmation', :with => "badpass"
end

Then(/^I should see an error message indicating that the passwords do not match$/) do
  text.should match(/Password doesn't match confirmation/)
end

Then(/^I should still see the change password screen$/) do
  current_url.should == update_user_password_url(@last_user_clicked)
end

When(/^I click the change roles link for a user$/) do
  find("a[href='/users/#{@users.first.id}/edit']").click
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

