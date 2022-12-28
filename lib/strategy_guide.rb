# frozen_string_literal: true

class StrategyGuide
  Round = Data.define(:opponent, :player) do
    def naive_points
      points_from_shape(naive_player_shape) + points_from_outcome(naive_player_shape)
    end

    def points
      points_from_shape(player_shape) + points_from_outcome(player_shape)
    end

    private

    def opponent_shape
      case opponent
      when "A" # Rock
        RPS.rock
      when "B" # Paper
        RPS.paper
      when "C" # Scissors
        RPS.scissors
      end
    end

    def naive_player_shape
      case player
      when "X" # Rock
        RPS.rock
      when "Y" # Paper
        RPS.paper
      when "Z" # Scissors
        RPS.scissors
      end
    end

    def player_shape
      case player
      when "X" # loss
        opponent_shape.beats
      when "Y" # draw
        opponent_shape
      when "Z" # win
        opponent_shape.beaten_by
      end
    end

    def points_from_shape(shape)
      case shape
      when RPS.rock
        1
      when RPS.paper
        2
      when RPS.scissors
        3
      end
    end

    def points_from_outcome(shape)
      case shape.against?(opponent_shape)
      when :win
        6
      when :draw
        3
      when :loss
        0
      end
    end
  end

  def initialize(rounds)
    @rounds = rounds
  end

  def naive_points
    @rounds.sum(&:naive_points)
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
