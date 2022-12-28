RSpec.describe RPS do
  it "can make Rock" do
    rock = RPS.rock
    expect(rock).to be_a(RPS::Rock)
  end

  it "can make Paper" do
    paper = RPS.paper
    expect(paper).to be_a(RPS::Paper)
  end

  it "can make Scissors" do
    scissors = RPS.scissors
    expect(scissors).to be_a(RPS::Scissors)
  end

  it "knows what it's beaten by", :aggregate_failures do
    expect(RPS.rock.beaten_by).to eq(RPS.paper)
    expect(RPS.paper.beaten_by).to eq(RPS.scissors)
    expect(RPS.scissors.beaten_by).to eq(RPS.rock)
  end

  it "knows what it beats", :aggregate_failures do
    expect(RPS.rock.beats).to eq(RPS.scissors)
    expect(RPS.paper.beats).to eq(RPS.rock)
    expect(RPS.scissors.beats).to eq(RPS.paper)
  end

  it "can be compared", :aggregate_failures do
    expect(RPS::Rock.new).to eq(RPS::Rock.new)
    expect(RPS::Rock.new).not_to eq(RPS::Paper.new)
    expect(RPS::Rock.new).not_to eq(RPS::Scissors.new)
  end

  it "knows a result of a game", :aggregate_failures do
    expect(RPS.rock.against?(RPS.rock)).to be(:draw)
    expect(RPS.rock.against?(RPS.paper)).to be(:loss)
    expect(RPS.rock.against?(RPS.scissors)).to be(:win)
  end
end
