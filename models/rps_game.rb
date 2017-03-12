class RPSGame

  attr_accessor :type

  def initialize(type)
    if type != :rock && type != :paper && type != :scissors
      raise self.class::PlayTypeError
    end

    @type = type
  end

  class PlayTypeError < StandardError

  end

  def self.valid_play?(type)
    if type == :rock || type == :paper || type == :scissors
      true
    else
      false
    end
  end

  def computer_play
    @computer_play = [:scissors, :rock, :paper].sample
  end

  def won?
    if @type == :rock && self.computer_play == :scissors
      true
    elsif @type == :scissors && self.computer_play == :paper
      true
    elsif @type == :paper && self.comptuer_play == :rock
      true
    else
      false
    end
  end

  def tied?
    if @type == self.computer_play
      true
    else
      false
    end
  end

  def lost?
    if self.won? == true || self.tied? == true
      false
    else
      true
    end
  end
end



