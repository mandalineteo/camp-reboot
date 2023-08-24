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
  binding.pry
end
