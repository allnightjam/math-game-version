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


lives = Lives.new
lives.game