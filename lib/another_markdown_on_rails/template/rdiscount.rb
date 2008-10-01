module AnotherMarkdownOnRails
  class Template::RDiscount < RDiscount

    MAX_HEADING_DEPTH = 10

    attr_accessor :heading_mapping

    old_to_html = instance_method(:to_html)

    define_method(:to_html) { |*args|
      text = old_to_html.bind(self).call(*args)
      map_headings(text)
    }

    protected 

    def map_headings(text)
      # puts "map_headings"
      # puts "@heading_mapping: #{@heading_mapping}"
      @heading_mapping ||= 0
      MAX_HEADING_DEPTH.downto(1) do |n|
        open = "<h#{n}>"
        close = "</h#{n}>"
        text.gsub! open, "<h#{(n + @heading_mapping).to_s}>"
        text.gsub! close, "</h#{(n + @heading_mapping).to_s}>"
      end
      text
    end
  end
end