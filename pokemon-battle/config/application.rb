require 'sinatra'
require "sinatra/activerecord"
require 'pry-byebug'
require 'sqlite3'

ActiveRecord::Base.logger = ActiveSupport::Logger.new(STDOUT)

configure :test do
  set :database, { adapter: 'sqlite3', database: 'spec/db/pokemon_battle_test.sqlite3' }
end
