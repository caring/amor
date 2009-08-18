require 'rubygems'
require 'rdiscount'

module AnotherMarkdownOnRails

  class Template < ActionView::TemplateHandler
  
    @@heading_mapping = 0

    def initialize(view)
      @view = view
    end
    
    def compilable?
      false
    end
    
    def self.map_headings_down_by(mapping)
      @@heading_mapping = mapping
    end
  
    def render(template, local_assigns = {})
      assigns = @view.assigns.dup
  
      if content_for_layout = @view.instance_variable_get("@content_for_layout")
        assigns['content_for_layout'] = content_for_layout
      end
      result = @view.instance_eval do
          assigns.each do |key,val|
            instance_variable_set "@#{key}", val
          end
          local_assigns.each do |key,val|
            class << self; self; end.send(:define_method,key) { val }
          end
        ERB.new(template.source, nil, '-').result(binding)
      end
      doc = RDiscount::new(result)
      doc.heading_mapping = @@heading_mapping
      return doc.to_html.to_s
    end 

  end
end