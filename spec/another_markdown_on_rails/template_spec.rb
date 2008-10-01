require File.dirname(__FILE__) + '/../spec_helper'

describe AnotherMarkdownOnRails::Template do
  
  describe ".initialize" do
    
    it "should store view" do
      view_mock = mock("View")
      template = AnotherMarkdownOnRails::Template.new(view_mock)
      template.instance_variable_get(:@view).should == view_mock
    end

  end
  
end
