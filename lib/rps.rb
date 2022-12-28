class RPS
  class Shape
    def ==(other)
      other.is_a?(self.class)
    end

    def against?(other)
      if beaten_by == other
        :loss
      elsif beats == other
        :win
      else
        :draw
      end
    end
  end

  class Rock < Shape
    def beaten_by = RPS.paper

    def beats = RPS.scissors
  end

  class Paper < Shape
    def beaten_by = RPS.scissors

    def beats = RPS.rock
  end

  class Scissors < Shape
    def beaten_by = RPS.rock

    def beats = RPS.paper
  end

  class << self
    def rock
      @rock ||= Rock.new
    end

    def paper
      @paper ||= Paper.new
    end

    def scissors
      @scissors ||= Scissors.new
    end
  end
end
