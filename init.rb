require 'another_markdown_on_rails'

ActionView::Template.register_template_handler('text', AnotherMarkdownOnRails)

AnotherMarkdownOnRails::map_headings_down_by 0