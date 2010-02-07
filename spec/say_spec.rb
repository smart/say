require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Say" do
  it "should say stuff" do
    p "If you don't hear the test passing.... it failed?"
    say("The test has passed").should == "The test has passed"
  end

  it "should be able to say as all the voices" do
    VOICES.each do |voice|
      p "My name is #{voice}"
      say_as(voice, "My name is #{voice}")
    end
  end
end
