class Player < ActiveRecord::Base
  # add your associations and methods here
  belongs_to :game
  has_many :pokemons
end
