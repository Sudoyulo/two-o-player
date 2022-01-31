class Game

  attr_accessor :player1, :player2

  def initialize(p1, p2)
    @player1 = p1
    @player2 = p2
    @@turn= @player1
    # puts "hello #{player1.name} and #{player2.name}"
  end

  def generate_question (player)
    @@random_number_a = rand(10)
    @@random_number_b = rand(10)
    print "Player #{player.name}, "
    puts "What is #{@@random_number_a} and #{@@random_number_b} ?"
    # @@answer = @@random_number_a + @@random_number_b
    # puts "It's #{@@answer}"
    @@random_number_a + @@random_number_b
  end
  
  def ask_question
    @@answer = generate_question(@@turn)
    @@guess = @@turn.guess

    if (@@answer.to_i == @@guess.to_i)
      puts "Player #{@@turn.name}: YES! You are correct!"
    else
      puts "Player #{@@turn.name}: No! You are wrong"
      @@turn.lose_life
    end
  end
  
  def check_points(player)

    if (player.lives == 0)
      puts "xxx GAME OVER xxx"
      turn_end
      puts "Player #{@@turn.name} wins with a score of #{@@turn.lives}/3"
      puts "Goodbye"
      return false
    else
      print_stats
      return true
    end
  end

  def turn_end
    
    if (@@turn.name == player1.name)
      # puts "#{@@turn.name}'s turn end"
      return @@turn = player2
    else
      # puts "#{@@turn.name}'s turn end"
      return @@turn = player1
    end
  end

  def print_stats
    puts "Player #{player1.name}: #{player1.lives}/3 vs Player #{player2.name}: #{player2.lives}/3"
    puts ""
    turn_end
  end

  def start
    @@continue = true
    while @@continue
      puts "--- NEW TURN ---"
      ask_question
      @@continue = check_points(@@turn)
    end #end while
  end #start

end