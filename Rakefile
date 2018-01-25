require 'rake/testtask'

task default: :test

desc 'Run the tests'

Rake::TestTask.new do |t|
  t.test_files = FileList['tests/*_test.rb']
  t.warning = false
end

desc 'Run the suite of tests in a docker container.'
task :runtests => [:build] do
  sh 'docker run -it amatar/gladiatorv2 rake'
end

desc 'Run a demo of the game in a docker container.'
task :demo => [:build] do
  sh 'docker run -it amatar/gladiatorv2 rake rundemo'
end

desc 'Run the file starting the game demo.'
task :rundemo do
  sh 'ruby lib/demo.rb'
end

desc 'Build a docker image for the game.'
task :build do
  sh 'docker build -t amatar/gladiatorv2 .'
end
