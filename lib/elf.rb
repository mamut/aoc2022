class Elf
  attr_accessor :index, :items

  def initialize(index, items)
    @index = index
    @items = items
  end

  def calories = @items.sum
end
