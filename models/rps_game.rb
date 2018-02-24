require 'pry'

class RPSGame
  attr_accessor :play, :computer_play

  @@wins = 0
  @@losses = 0
  @@ties = 0
  
  VALID_PLAYS = [:rock, :paper, :scissors]

  def initialize(play)
    
    if RPSGame.valid_play?(play)
      @play = play
      @computer_play = VALID_PLAYS[rand(3)]
      update_record
    else
      raise RPSGame::PlayTypeError
    end
  end

  def self.valid_play?(play)
    if VALID_PLAYS.include?(play)
      true
    else
      false
    end
  end

  def self.reset_counts
    @@wins = 0
    @@losses = 0
    @@ties = 0
  end

  def self.wins
    @@wins
  end

  def self.ties
    @@ties
  end

  def self.losses
    @@losses
  end

  def won?
    if @play == :rock && @computer_play == :scissors
      return true
    elsif @play == :paper && @computer_play == :rock
      return true
    elsif @play == :scissors && @computer_play == :paper
      return true
    elsif @play == :rock && @computer_play == :paper
      return false
    elsif @play == :paper && @computer_play == :scissors
      return false
    elsif @play == :scissors && @computer_play == :rock
      return false
    else
      return false
    end
  end

  def tied?
    return @play == @computer_play
  end

  def lost?
    return (not self.won?()) && (not self.tied?())
  end

  def update_record
    if won?
      @@wins += 1
    elsif tied?
      @@ties += 1
    elsif lost?
      @@losses += 1
    end
  end

end

class RPSGame::PlayTypeError < TypeError; end
