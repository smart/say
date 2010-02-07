require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Say" do
  it "should say stuff" do
    p "If you don't hear the test passing.... it failed?"
    say("The test has passed").should == "The test has passed"
  end
end
