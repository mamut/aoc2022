class Elf
  attr_accessor :index, :items

  def initialize(index, items)
    @index = index
    @items = items
  end

  def calories = items.sum

  class << self
    def parse(data)
      data.split("\n\n").map.with_index(1) do |group, index|
        new(index, group.split("\n").map(&:to_i))
      end
    end
  end
end
