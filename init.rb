require 'another_markdown_on_rails'

if Rails::VERSION::STRING < '2.1.0'
  ActionView::Base.register_template_handler('text', AnotherMarkdownOnRails)
else
  ActionView::Template.register_template_handler('text', AnotherMarkdownOnRails)
end

AnotherMarkdownOnRails::map_headings_down_by 0