# frozen_string_literal: true

class StrategyGuide
  Round = Data.define(:opponent, :player) do
    def points
      points_from_shape + points_from_outcome
    end

    private

    def points_from_shape
      case player
      when "X" # Rock
        1
      when "Y" # Paper
        2
      when "Z" # Scissors
        3
      end
    end

    def points_from_outcome
      case opponent
      when "A" # Rock
        return 3 if player == "X"
        (player == "Y") ? 6 : 0
      when "B" # Paper
        return 3 if player == "Y"
        (player == "Z") ? 6 : 0
      when "C" # Scissors
        return 3 if player == "Z"
        (player == "X") ? 6 : 0
      end
    end
  end

  def initialize(rounds)
    @rounds = rounds
  end

  def points
    @rounds.sum(&:points)
  end

  class << self
    def parse(data)
      data.split("\n").map do |raw_round|
        opponent, player = raw_round.split(" ")
        Round.new(opponent, player)
      end.then do |rounds|
        new(rounds)
      end
    end
  end
end
