require "rspec/core/rake_task"
require "standard/rake"

RSpec::Core::RakeTask.new(:spec)

Dir["./lib/*.rb"].each { |file| require file }

task default: [:spec, "standard:fix"]

desc "Elves carrying calories"
task :day01 do
  caravan = Caravan.parse File.read("data/day01.txt")
  puts caravan.most_calories
end
