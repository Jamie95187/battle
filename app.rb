require 'sinatra/base'

class Battle < Sinatra::Base
  enable :sessions

  get '/' do
    erb(:index)
  end

  post '/names' do
    session[:player_1] = params["player 1"]
    session[:player_2] = params["player 2"]
    redirect to '/play'
  end

  get '/play' do
    @player_1 = session[:player_1]
    @player_2 = session[:player_2]
    @message = session.delete(:message)
    erb :play
  end

  post '/attack' do
    session[:message] = "Successful attack!"
    redirect to '/play'
  end

  run! if app_file == $0
end
