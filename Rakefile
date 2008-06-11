require 'rake/clean'
require 'rake/testtask'
require 'rake/rdoctask'
begin
  require 'rubygems'
  require 'rake/gempackagetask'
rescue Exception
  nil
end


require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'
require 'rcov/rcovtask'

desc 'Default: run unit tests.'
task :default => :test


Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = true
end
