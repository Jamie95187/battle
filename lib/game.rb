class Game
  attr_reader :player1, :player2

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @turn = player1
  end

  def attack
    @turn == @player1 ? @player2.reduce_health(10) : @player1.reduce_health(10)
    @turn == @player1 ? @turn = @player2 : @turn = @player1
  end

  def turn
    @turn
  end
end
