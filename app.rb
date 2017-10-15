require 'sinatra/base'
require_relative './lib/player'
require_relative './lib/game'

class RockPaperScissors < Sinatra::Base

  before do
    @game = Game.instance
  end

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
    @player_choice = params[:choice].downcase
    @result = @game.result(@player_choice)
    erb(:result)
  end
end
