RSpec.describe StrategyGuide do
  let(:guide) do
    described_class.parse <<~DATA
      A Y
      B X
      C Z
    DATA
  end

  it "calculates the naive scoring" do
    expect(guide.naive_points).to eq(15)
  end

  it "calculates the actual scoring" do
    expect(guide.points).to eq(12)
  end
end
