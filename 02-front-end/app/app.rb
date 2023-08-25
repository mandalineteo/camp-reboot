require 'sinatra'
require "sinatra/json"
require 'pry-byebug'

require_relative '../config/application'

# homepage
get '/' do
  erb :index
end

# new game
get '/games/new' do
  erb :'game/new'
end
