%w(template version).each {|lib| require File.dirname(__FILE__) + "/another_markdown_on_rails/#{lib}" }


ActionView::Template.register_template_handler('text', AnotherMarkdownOnRails::Template)
AnotherMarkdownOnRails::Template::map_headings_down_by 0