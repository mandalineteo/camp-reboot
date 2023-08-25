require 'sinatra'
require "sinatra/json"
require 'pry-byebug'

require_relative '../config/application'

def create_pokemon(pokemon_name, player)
  attributes = Pokemon.details(pokemon_name)
  attributes[:player] = player
  Pokemon.create(attributes)
end

def create_player_json(player)
  {
    **JSON.parse(player.to_json),
    pokemons: player.pokemons.map { |pokemon| JSON.parse(pokemon.to_json) }
  }
end

get '/' do
  erb :index
end

get '/games/new' do
  erb :'game/new'
end

get '/games/:id' do
  game = Game.find(params[:id])
  player1 = game.players.first
  player2 = game.players.last

  game_json = {
    game: game.id,
    player1: create_player_json(player1),
    player2: create_player_json(player2)
  }

  json game_json
end

get '/players/:id' do
  player = Player.find(params[:id]).to_json
  json player
end

get '/games/:id/battle' do
  @game = Game.find(params[:id])
  @player1 = @game.players.first
  @player2 = @game.players.last
  erb :'game/battle'
end

post '/games' do
  game = Game.create

  player1 = Player.create(name: params['player_1_name'], game: game)
  player2 = Player.create(name: params['player_2_name'], game: game)

  create_pokemon(params['player_1_pokemon_1'], player1)
  create_pokemon(params['player_1_pokemon_2'], player1)
  create_pokemon(params['player_1_pokemon_3'], player1)
  create_pokemon(params['player_2_pokemon_1'], player2)
  create_pokemon(params['player_2_pokemon_2'], player2)
  create_pokemon(params['player_2_pokemon_3'], player2)

  redirect "/games/#{game.id}/battle"
end
