require 'spec_helper'

describe User do

  context "created with valid params" do
    valid_attrs = {name: "Spec User", username: "SpecUser", password: "mypass", password_confirmation: "mypass", admin: true, supervisor: false, csr: false } 
    let(:user) { User.new valid_attrs }

    valid_attrs.each do |key, value|
      context "#{key.to_s} value should be assigned" do
        it {user.send(key).should == value}
      end
    end
    
  end
  
end
