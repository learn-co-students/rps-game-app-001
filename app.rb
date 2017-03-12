require_relative 'config/environment'
require_relative 'models/rps_game.rb'

class GameApp < Sinatra::Base
  get '/rps/:play' do
    @play = [:scissors, :rock, :paper].sample
    @rps_game = RPSGame.new(@play)
    @rps_game.computer_play
    erb :rps_game
  end
end
