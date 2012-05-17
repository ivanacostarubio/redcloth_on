require File.expand_path(File.dirname(__FILE__) + '/spec_helper')
require 'RedCloth'

class TestingClass 


  def attributes
    {"testing" => "*hello*"}
  end

  def testing
    attributes["testing"]
  end

  def nil_value
    nil
  end

  include RedCloth::ActiveModelDecorator

  redcloth_on [:testing, :nil_value]


end


describe "RedclothOn" do


  it "overwrite the testing attribute" do 
    TestingClass.new.testing.should == "<p><strong>hello</strong></p>"
  end

  it "should not raise when the attribute is nil" do
    lambda{ TestingClass.new.nil_value }.should_not raise_error

  end

end
