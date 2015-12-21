require_relative 'config/environment'

class GameApp < Sinatra::Base
  get '/rps/:play' do
    # Your app code goes here
    @game = RPSGame.new(params[:play])

    erb :rps_game
  end
end
