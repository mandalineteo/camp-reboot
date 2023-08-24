require 'sinatra'
require "sinatra/activerecord"
require 'pry-byebug'
require 'sqlite3'

Dir.glob(File.join(File.dirname(__FILE__), '../app/models', '*.rb')).sort.each do |file|
  require_relative file
end

ActiveRecord::Base.logger = ActiveSupport::Logger.new(STDOUT)

configure :test do
  set :database, { adapter: 'sqlite3', database: 'spec/db/pokemon_battle_test.sqlite3' }
end
