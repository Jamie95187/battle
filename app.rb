require 'sinatra/base'

class Battle < Sinatra::Base
  get '/' do
    erb(:index)
  end

  post '/names' do
    @player_1 = params["player 1"]
    erb(:play)
  end
end
