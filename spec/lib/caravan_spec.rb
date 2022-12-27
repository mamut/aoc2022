RSpec.describe Caravan do
  it "knows which elf carries the most calories" do
    caravan = described_class.parse <<~DATA
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

    expect(caravan.most_calories).to eq(24000)
  end
end
