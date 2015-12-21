class RPSGame
  attr_reader :move
  attr_accessor :computer

  VALID_MOVES = ['rock', 'paper', 'scissors']

  WINNING_OUTCOMES = {
    'rock' => 'scissors',
    'scissors' => 'paper',
    'paper' => 'rock'
  }

  class PlayTypeError < StandardError
  end

  def initialize(move)
    @move = move.to_s
    if !VALID_MOVES.include?(move.to_s.downcase)
      raise PlayTypeError, 'Not a valid move.'
    end
    computer_play
  end

  def self.valid_play?(move)
    !!(VALID_MOVES.include?(move.to_s.downcase))
  end

  def computer_play
    @computer = VALID_MOVES[rand(VALID_MOVES.length)].to_sym
  end

  def won?
    !!(WINNING_OUTCOMES[move] == computer.to_s)
  end

  def tied?
    !!(move == computer.to_s)
  end

  def lost?
    !!(WINNING_OUTCOMES[computer.to_s] == move)
  end
end
