require "rspec/core/rake_task"
require "standard/rake"

RSpec::Core::RakeTask.new(:spec)

Dir["./lib/*.rb"].each { |file| require file }

task default: [:spec, "standard:fix"]

desc "Day 1: Calorie Counting"
task :day01 do
  caravan = Caravan.parse File.read("data/day01.txt")
  puts caravan.most_calories
  puts caravan.top3_calories
end

desc "Day 2: Rock Paper Scissors"
task :day02 do
  guide = StrategyGuide.parse File.read("data/day02.txt")
  puts guide.points
end
