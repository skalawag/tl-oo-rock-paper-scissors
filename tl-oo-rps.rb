# Object Oriented version of RPS

class Player
  attr_reader :name

  def initialize()
    @name = name.capitalize
  end

  def to_s
    return "#Player: {name}"
  end
end

class Gesture
  def initialize(beats, ties, loses)
    @beats = beats
    @ties = ties
    @loses = loses
  end

  def beats?(other)
    if other.is_a?(@beats)
      return 1
    elsif other.is_a?(@ties)
      return 0
    elsif other.is_a?(@loses)
      return -1
    end
  end
end

class Scissors < Gesture
  attr_reader :played_by

  def initialize(played_by)
    @played_by = played_by
    super(Paper, Scissors, Rock)
  end

  def to_s
    return "Scissors, played by #{played_by.name}"
  end
end

class Paper < Gesture
  attr_reader :played_by

  def initialize(played_by)
    @played_by = played_by
    super(Rock, Paper, Scissors)
  end

  def to_s
    return "Paper, played by #{played_by.name}"
  end
end

class Rock < Gesture
  attr_reader :played_by

  def initialize(played_by)
    @played_by = played_by
    super(Scissors, Rock, Paper)
  end

  def to_s
    return "Paper, played by #{played_by.name}"
  end
end

class RockPaperScissors
end
