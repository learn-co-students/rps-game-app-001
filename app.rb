require_relative 'config/environment'

class GameApp < Sinatra::Base

  get '/rps/clear-counts' do
    RPSGame.reset_counts
    erb :cleared_counts
  end

  get '/rps/:play' do
    play = params[:play].to_sym
    puts play
    @game = RPSGame.new(play)
    erb :rps_game
  end
end
