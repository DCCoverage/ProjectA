require 'rake/testtask'
require 'rubocop/rake_task'

task default: %w[lint test]

Rake::TestTask.new(:test) do |t|
  t.libs = %w[lib test]
  t.warning = true
  t.verbose = true
  t.test_files = FileList['test/**/*_test.rb']
end

RuboCop::RakeTask.new(:lint) do |task|
  task.patterns = ['lib/**/*.rb', 'test/*.rb']
  task.fail_on_error = false
end
