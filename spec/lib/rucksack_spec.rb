RSpec.describe Rucksack, :aggregate_failures do
  it do
    collection = described_class::Collection.from_string(<<~DATA)
      vJrwpWtwJgWrhcsFMMfFFhFp
      jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL
      PmmdzqPrVvPwwTWBwg
      wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn
      ttgJtRGJQctTZtZT
      CrZsJsPPZsGzwwsLwLmpwMDw
    DATA
    expect(collection.sum_of_duplicate_priorities).to eq(157)
  end

  it do
    rucksack = described_class.new("vJrwpWtwJgWrhcsFMMfFFhFp")
    expect(rucksack.duplicate).to eq("p")
    expect(rucksack.duplicate_priority).to eq(16)
  end

  it do
    rucksack = described_class.new("jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL")
    expect(rucksack.duplicate).to eq("L")
    expect(rucksack.duplicate_priority).to eq(38)
  end

  it do
    rucksack = described_class.new("PmmdzqPrVvPwwTWBwg")
    expect(rucksack.duplicate).to eq("P")
    expect(rucksack.duplicate_priority).to eq(42)
  end

  it do
    rucksack = described_class.new("wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn")
    expect(rucksack.duplicate).to eq("v")
    expect(rucksack.duplicate_priority).to eq(22)
  end

  it do
    rucksack = described_class.new("ttgJtRGJQctTZtZT")
    expect(rucksack.duplicate).to eq("t")
    expect(rucksack.duplicate_priority).to eq(20)
  end

  it do
    rucksack = described_class.new("CrZsJsPPZsGzwwsLwLmpwMDw")
    expect(rucksack.duplicate).to eq("s")
    expect(rucksack.duplicate_priority).to eq(19)
  end
end
