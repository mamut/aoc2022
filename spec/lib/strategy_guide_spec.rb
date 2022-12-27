RSpec.describe StrategyGuide do
  it do
    guide = described_class.parse <<~DATA
      A Y
      B X
      C Z
    DATA

    expect(guide.points).to eq(15)
  end
end
