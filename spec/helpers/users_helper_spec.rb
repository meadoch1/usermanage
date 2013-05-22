require 'spec_helper'

describe UsersHelper do
  context "with no id" do
    context " with true parameter" do
      it { helper.div_for_boolean(true).should == "<div class='icon-ok'></div>" }
    end
    
    context " with false parameter" do
      it { helper.div_for_boolean(false).should == "<div></div>" }
    end
  end
  context "with id" do
    context " with true parameter" do
      it { helper.div_for_boolean(true,'foo').should == "<div id='foo' class='icon-ok'></div>" }
    end
    
    context " with false parameter" do
      it { helper.div_for_boolean(false, 'bar').should == "<div id='bar'></div>" }
    end
  end
  
  
end

