require 'rake/testtask'

Rake::TestTask.new do |t|
  t.test_files = FileList['tests/*_test.rb']
  t.warning = false
end

task default: :test

=begin
# idk what I'm doing here.
task :test do
  sh "docker run -it f596fba1668a"
end
=end