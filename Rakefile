require "rspec/core/rake_task"
require "standard/rake"

RSpec::Core::RakeTask.new(:spec)

Dir["./lib/*.rb"].each { |file| require file }

task default: [:spec, "standard:fix"]

desc "Elves carrying calories"
task :day01 do
  load "./day01.rb"
end
