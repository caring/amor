require 'lib/markdown_template'
Gem::Specification.new do |s|
  s.name = %q{markdown_template}
  s.version = MarkdownTemplate::VERSION::STRING
  s.date = Time.now.strftime("%Y-%m-%d")
  s.summary = %q{markdown_template is a rails template handler for John Gruber's Markdown format.}
  s.email = %q{keith@rubygreenblue.com}
  s.homepage = %q{http://www.rubygreenblue.com/}
  s.autorequire = %q{markdown_template}
  s.has_rdoc = false
  s.authors = ["Keith Rowell"]
  s.files = ["lib/markdown_template.rb"]
  s.bindir = nil
  s.required_ruby_version = nil
  s.platform = nil
  s.requirements = ["bluecloth"]
end
