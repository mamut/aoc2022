RSpec.describe Elf do
  it "knows which elf carries the most calories" do
    elves = Elf.parse <<~DATA
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

    top_calories = elves.max_by(&:calories).calories
    expect(top_calories).to eq(24000)
  end
end
