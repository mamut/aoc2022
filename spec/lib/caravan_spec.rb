RSpec.describe Caravan do
  let(:caravan) do
    described_class.parse <<~DATA
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
  end

  it "knows how much calories the top elf carries" do
    expect(caravan.most_calories).to eq(24000)
  end

  it "knows how much calories top 3 elves carry" do
    expect(caravan.top3_calories).to eq(45000)
  end
end
