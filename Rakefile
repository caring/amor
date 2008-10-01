require 'rake'
require 'rubygems'
require 'rake/rdoctask'
require 'rake/testtask'
require 'spec/rake/spectask'

desc 'Default: run specs'
task :default => [:spec]

desc "Run all specs"
Spec::Rake::SpecTask.new do |t|
  t.spec_files = FileList['spec/**/*_spec.rb']
  t.spec_opts = ['--options', 'spec/spec.opts']
end