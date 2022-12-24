require "rspec/core/rake_task"
require "standard/rake"

RSpec::Core::RakeTask.new(:spec)

task default: [:spec, "standard:fix"]

desc "Elves carrying calories"
task :day01 do
  load "./day01.rb"
end
