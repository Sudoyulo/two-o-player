class Player
  attr_accessor :name, :lives, :guess

  @@player_id = 0
  def initialize
    @@player_id += 1
    # puts "initialized player #{@@player_id}"
    @name = "#{@@player_id}"
    @lives = 3
    @guess = ""
  end

  def info
    puts "Player #{name} has #{lives} lives"
  end

  def guess
    @guess = $stdin.gets.chomp.to_i
    # puts "You guessed #{@guess}"
    @guess
  end

  def lose_life
    @lives -= 1
  end

end