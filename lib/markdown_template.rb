require 'bluecloth'

class MarkdownTemplate
  
  @@heading_mapping = 0

  def initialize(view)
    @view = view
  end
  
  def self.map_headings_down_by(mapping)
    @@heading_mapping = mapping
  end

  def render(template, assigns)
    doc = BlueCloth::new(template)
    doc.heading_mapping = @@heading_mapping
    doc.to_html
  end 
  
  # todo
  # use the following code to enable setting of inline ruby code in the markdown templates
  #def render(template, assigns) 
  #  # create an anonymous object and get its binding 
  #  env = Object.new.send(:binding) 
  #  bind = env.send(:binding) 
  #  # Add in the instance variables from the view 
  #  @view.assigns.each do |key, value| 
  #    env.instance_variable_set("@#{key}", value) 
  #  end 
  #  # and local variables if we're a partial 
  #  assigns.each do |key, value| 
  #    eval("#{key} = #{value}", bind) 
  #  end 
  #  @view.controller.headers["Content-Type"] ||= 'text/plain' 
  #  # evaluate each line and show the original alongside 
  #  # its value 
  #  template.split(/\n/).map do |line| 
  #    line + " => " + eval(line, bind).to_s 
  #  end.join("\n") 
  #end 

  module VERSION
    MAJOR = 0
    MINOR = 0
    TINY  = 1
    STRING = [MAJOR, MINOR, TINY].join('.')          
  end

end


class BlueCloth
  
  MAX_HEADING_DEPTH = 10

  attr_accessor :heading_mapping
  
  old_to_html = instance_method(:to_html)

  define_method(:to_html) { |*args|
    text = old_to_html.bind(self).call(*args)
    map_headings(text)
  }
  
  protected 
    
  def map_headings(text)
    MAX_HEADING_DEPTH.downto(1) do |n|
      open = "<h#{n}>"
      close = "</h#{n}>"
      text.gsub! open, "<h#{(n + @heading_mapping).to_s}>"
      text.gsub! close, "</h#{(n + @heading_mapping).to_s}>"
    end
    text
  end
  
end
