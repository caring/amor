%w(another_markdown_on_rails).each {|req| require req}

ActionView::Base.register_template_handler('text', AnotherMarkdownOnRails)
AnotherMarkdownOnRails::map_headings_down_by 0
