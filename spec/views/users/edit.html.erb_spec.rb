require 'spec_helper'

describe "users/edit" do
  before(:each) do
    @user = assign(:user, stub_model(User,
      :name => "MyString",
      :username => "MyString",
      :password_digest => "MyString"
    ))
  end

  it "renders the edit user form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", user_path(@user), "post" do
      assert_select "input#user_admin[name=?]", "user[admin]"
      assert_select "input#user_supervisor[name=?]", "user[supervisor]"
      assert_select "input#user_csr[name=?]", "user[csr]"
    end
  end
end
