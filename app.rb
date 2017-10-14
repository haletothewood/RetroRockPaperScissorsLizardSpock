require 'sinatra/base'
require_relative './lib/player'
require_relative './lib/game'

class RockPaperScissors < Sinatra::Base

  get '/infastructure' do
    "Testing Infastructure"
  end

  get '/' do
    erb(:title)
  end

  post '/play' do
    @game = Game.create(Player.new(params[:name]))
    erb(:play)
  end

  post '/result' do
    @choice = params[:choice].downcase
    @result = Game.instance.result(@choice)
    erb(:result)
  end
end
