require 'sinatra/base'
require_relative 'lib/player'

class Battle < Sinatra::Base
  enable :sessions

  get '/' do
    erb(:index)
  end

  post '/names' do
    player1 = Player.new params["player 1"]
    player2 = Player.new params["player 2"]
    session[:game] = Game.new(player1, player2)
    redirect to '/play'
  end

  get '/play' do
    @player_1 = session[:game].player1
    @player_2 = session[:game].player2
    @message = session.delete(:message)
    erb :play
  end

  post '/attack' do
    session[:message] = "Successful attack!"
    session[:game].attack
    redirect to '/play'
  end

  run! if app_file == $0
end
