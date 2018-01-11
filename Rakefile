require 'rake/testtask'

task default: :test

desc 'Run the tests'
task :test do
  Rake::TestTask.new do |t|
    t.test_files = FileList['tests/*_test.rb']
    t.warning = false
  end
end

desc 'Build docker image'
task :build do
  sh 'docker build -t amatar/gladiatorv2 .'
end

desc 'Run docker image'
task :run do
  sh 'docker run -it amatar/gladiatorv2 rake'
end