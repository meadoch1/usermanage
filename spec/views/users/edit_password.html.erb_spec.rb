require 'spec_helper'

describe "users/edit_password" do
  before(:each) do
    @user = assign(:user, stub_model(User,
                                     :name => "MyString",
                                     :username => "MyString",
                                     :password => "mypass",
                                     :password_confirmation => "mypass"

    ))
  end

  it "renders the edit user password form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", update_user_password_path(@user), "post" do
      assert_select "input#user_password[name=?]", "user[password]"
      assert_select "input#user_password_confirmation[name=?]", "user[password_confirmation]"
    end
  end
end
