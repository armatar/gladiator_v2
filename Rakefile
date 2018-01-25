require 'rake/testtask'

task default: :test

desc 'Run the tests'

Rake::TestTask.new do |t|
  t.test_files = FileList['tests/*_test.rb']
  t.warning = false
end

desc 'Run docker image'
task :runtests => [:build] do
  sh 'docker run -it amatar/gladiatorv2 rake'
end

desc 'Run a demo of the game.'
task :demo => [:build] do
  sh 'docker run -it amatar/gladiatorv2 rake rundemo'
end

task :rundemo do
  sh 'ruby lib/demo.rb'
end

task :build do
  sh 'docker build -t amatar/gladiatorv2 .'
end
