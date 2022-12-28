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
        :rock
      when "B" # Paper
        :paper
      when "C" # Scissors
        :scissors
      end
    end

    def naive_player_shape
      case player
      when "X" # Rock
        :rock
      when "Y" # Paper
        :paper
      when "Z" # Scissors
        :scissors
      end
    end

    def player_shape
      case player
      when "X" # loss
        case opponent_shape
        when :rock
          :scissors
        when :paper
          :rock
        when :scissors
          :paper
        end
      when "Y" # draw
        opponent_shape
      when "Z" # win
        case opponent_shape
        when :rock
          :paper
        when :paper
          :scissors
        when :scissors
          :rock
        end
      end
    end

    def points_from_shape(shape)
      case shape
      when :rock
        1
      when :paper
        2
      when :scissors
        3
      end
    end

    def points_from_outcome(shape)
      return 3 if opponent_shape == shape

      case opponent_shape
      when :rock
        (shape == :paper) ? 6 : 0
      when :paper
        (shape == :scissors) ? 6 : 0
      when :scissors
        (shape == :rock) ? 6 : 0
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
