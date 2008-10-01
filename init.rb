require File.dirname(__FILE__) + '/lib/another_markdown_on_rails'
ActionView::Template.register_template_handler('text', AnotherMarkdownOnRails::Template)
AnotherMarkdownOnRails::Template::map_headings_down_by 0