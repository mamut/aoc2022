data = <<~DATA
  1000
  2000
  3000

  4000

  5000
  6000

  7000
  8000
  9000

  10000
DATA

class Elf
  attr_accessor :index, :items

  def initialize(index, items)
    @index = index
    @items = items
  end

  def calories = items.sum

  class << self
    def load(data)
      data.split("\n\n").map.with_index(1) do |group, index|
        new(index, group.split("\n").map(&:to_i))
      end
    end
  end
end

elves = Elf.load(data)
puts elves.max_by(&:calories).calories

file_data = File.read("day01.txt")
elves = Elf.load(file_data)
puts elves.max_by(&:calories).calories