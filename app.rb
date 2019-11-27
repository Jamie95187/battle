require 'sinatra/base'
require_relative 'lib/player'

class Battle < Sinatra::Base
  enable :sessions

  get '/' do
    erb(:index)
  end

  post '/names' do
    session[:player1] = Player.new params["player 1"]
    session[:player2] = Player.new params["player 2"]
    redirect to '/play'
  end

  get '/play' do
    @player_1 = session[:player1]
    @player_2 = session[:player2]
    @message = session.delete(:message)
    erb :play
  end

  post '/attack' do
    session[:message] = "Successful attack!"
    session[:player2].reduce_health(10)
    redirect to '/play'
  end

  run! if app_file == $0
end
