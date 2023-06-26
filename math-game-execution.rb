# - both players start with 3 lives
#   - wrong = lose a life
#   - end of every turn, the game shows lives
# - take turns answering
# - new math question by picking 2 numbers b/w 1-2
# - Use gets.chomp to get input from users and puts for output
# - Use puts, raise some_val.inspect, and byebug to help with debugging



class Player 

  attr_accessor :player_name, :lives

  def initialize(player_name)
    @player_name = player_name
    @lives = 3
  end

  def lose_a_life 
    @lives -= 1
  end
end


class Lives 

  attr_accessor :player1, :player2

  def initialize
    @players = []
  end

  def player_names
    puts "Player 1:"
    player1 = Player.new(gets.chomp)
    @players << player1
    puts "Good Luck #{player1.player_name}"

    puts "Player 2:"
    player2 = Player.new(gets.chomp)
    @players << player2
    puts "Good Luck #{player2.player_name}"
  end

  def game
    player_names

    game_over = false

    loop do 
      @players.each do |player|
        break if game_over

        question
        answer = nil

        unless game_over
          answer = gets.chomp.to_i
          check(player, answer)
          if player.lives > 1
            puts "#{player.player_name} has #{player.lives} lives left."
          elsif player.lives === 1
            puts "#{player.player_name} has 1 life left."
          end
        end

        if player.lives.zero?
          puts "#{player.player_name} has 0 lives! "
          announce_winner
          game_over = true
          break
        end
      end
    end
  end

  def question
    @number1 = rand(1...20)
    @number2 = rand(1...20)
    @number_question = @number1 - @number2
    puts "--- NEW TURN ---"
    puts "What is #{@number1} - #{@number2}?"
  end
  
  def check(player, answer)
    if answer != @number_question
      player.lose_a_life
      puts "Wrong answer! #{player.player_name} loses a life."
    else 
      puts "Correct!"
    end
  end

  def announce_winner
    winner = @players.find { |p| p.lives.positive? }
    puts "--- GAME OVER ---"
    puts "The winner is #{winner.player_name}! Congrats!"
  end
end

lives = Lives.new
lives.game