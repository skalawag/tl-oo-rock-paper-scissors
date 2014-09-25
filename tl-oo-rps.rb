# Object Oriented version of RPS

class Player
  attr_reader :name

  def initialize(name)
    @name = name.capitalize
  end

  def to_s
    return "Player: {name}"
  end
end

class Gesture
  def initialize(beats, ties, loses)
    @beats = beats
    @ties = ties
    @loses = loses
  end

  def beats?(other)
    # Return the winner or 0
    if other.is_a?(@beats)
      return self.played_by
    elsif other.is_a?(@ties)
      return 0
    elsif other.is_a?(@loses)
      return other.played_by
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
    return "Rock, played by #{played_by.name}"
  end
end

class RockPaperScissors
  attr_accessor :human_score, :bot_score

  def initialize()
    @human = Player.new(greet())
    @human_score = 0
    @bot = Player.new("Bot")
    @bot_score = 0
    main
  end

  def make_choice(choice, player)
    if choice == 'r'
      return Rock.new(player)
    elsif choice == 'p'
      return Paper.new(player)
    else
      return Scissors.new(player)
    end
  end

  def get_human_choice
    puts "Enter your play: (r/p/s)"
    choice = gets.chomp
    while not choice =~ /r|p|s/
      puts "Eh? Enter your play: (r/p/s)"
      choice = gets.chomp
    end
    return make_choice(choice, @human)
  end

  def bot_choose
    return make_choice(['r', 'p', 's'].sample,@bot)
  end

  def greet()
    puts "Welcome to Rock, Paper, Scissros!"
    puts "Enter your name:"
    return gets.chomp
  end

  def update_score(player)
    if player == 0
      #pass
    elsif player.name == "Bot"
      # why do i get an error if i write bot_score += 1?
      @bot_score += 1
    else
      @human_score += 1
    end
  end

  def main
    title = "Rock Paper Scissors!\n" + "-" * 20 + "\n\n"
    while true
      system 'clear'
      puts title
      human_choice = get_human_choice()
      system 'clear'
      puts title
      bot_choice = bot_choose()
      winner = human_choice.beats?(bot_choice)
      update_score(winner)
      puts human_choice.to_s
      puts bot_choice.to_s
      puts ""
      if winner == 0
        puts "It's a tie!"
        puts ""
      else
        puts "#{winner.name} wins!"
        puts ""
      end
      puts "Bot score: #{@bot_score}"
      puts "Human score: #{@human_score}"
      puts ""
      puts "Want another chance? (y/n)"
      if gets.chomp != 'y'
        break
      end
    end
  end
end

g = RockPaperScissors.new()
