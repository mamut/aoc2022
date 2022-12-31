class Rucksack
  def initialize(string)
    @string = string
  end

  def duplicate
    count = @string.length / 2
    left = @string.slice(0, count)
    right = @string.slice(count, count)
    (left.chars & right.chars).first
  end

  def duplicate_priority
    case duplicate
    when "a".."z"
      duplicate.ord - 96
    when "A".."Z"
      duplicate.ord - 38
    end
  end

  class Collection
    def initialize(rucksacks)
      @rucksacks = rucksacks
    end

    def sum_of_duplicate_priorities
      @rucksacks.sum(&:duplicate_priority)
    end

    class << self
      def from_string(string)
        rucksacks = string.split("\n").map { Rucksack.new(_1) }
        new(rucksacks)
      end
    end
  end
end
