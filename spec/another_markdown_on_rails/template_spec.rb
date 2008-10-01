require File.dirname(__FILE__) + '/../spec_helper'
require 'action_controller'
require 'action_controller/cgi_ext'
require 'action_controller/test_process'
require 'action_view/test_case'

module AnotherMarkdownOnRails

  class Template
    
    def self.heading_mapping
      @@heading_mapping
    end
    
  end
  
end

describe AnotherMarkdownOnRails::Template do
  
  before(:each) do
    @view_mock = mock("View")
    @template = AnotherMarkdownOnRails::Template.new(@view_mock)
    AnotherMarkdownOnRails::Template.map_headings_down_by(0)
  end
  
  describe ".initialize" do
    
    it "should store view" do
      @template.instance_variable_get(:@view).should == @view_mock
    end

  end
  
  describe ".compilable?" do

    it "should return false" do
      @template.compilable?.should be_false
    end

  end
  
  describe ".map_headings_down_by" do

    it "should store @@heading_mapping" do
      mapping_mock = mock("mapping")
      AnotherMarkdownOnRails::Template.map_headings_down_by(mapping_mock)
      AnotherMarkdownOnRails::Template.heading_mapping.should == mapping_mock
    end

  end
  
  describe ".render" do
    
    it "should return html generated from markdown" do
      
      PATH = File.expand_path(File.dirname(__FILE__) + "/../resources")
      ActionController::Base.view_paths = PATH
      
      @view = ActionView::Base.new(PATH)
      @path = "test.text"
      template = ActionView::Template.new(@view, @path, true)
      
      lala = AnotherMarkdownOnRails::Template.new(@view)
      lala.render(template).should == File.read(PATH + "/test.html")
    end

  end
  
end
