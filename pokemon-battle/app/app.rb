require 'sinatra'
require 'pry-byebug'

get '/' do
  erb :index
end

get '/games/new' do
  erb :'game/new'
end

get 'games/battle' do
  erb :'game/battle'
end

post '/games' do
#   {"player_1_name"=>"Kim Washington",
#  "player_1_pokemon_1"=>"vulpix",
#  "player_1_pokemon_2"=>"gastly",
#  "player_1_pokemon_3"=>"caterpie",
#  "player_2_name"=>"Michael Garner",
#  "player_2_pokemon_1"=>"pidgeot",
#  "player_2_pokemon_2"=>"primeape",
#  "player_2_pokemon_3"=>"starmie"}

end
