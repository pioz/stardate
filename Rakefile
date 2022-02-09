require 'bundler/gem_tasks'
require 'rake/testtask'

Rake::TestTask.new do |test|
  test.libs << 'test'
  test.warning = true
  test.test_files = FileList["test/test_#{ENV['T'] || '*'}.rb"]
end
