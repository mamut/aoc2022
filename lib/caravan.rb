class Caravan
  def initialize(elves)
    @elves = elves.sort_by(&:calories)
  end

  def most_calories
    @elves.last&.calories
  end

  class << self
    def parse(data)
      data.split("\n\n").map.with_index(1) do |group, index|
        Elf.new(index, group.split("\n").map(&:to_i))
      end.then do |elves|
        new(elves)
      end
    end
  end
end
