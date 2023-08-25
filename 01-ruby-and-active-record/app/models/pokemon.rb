require 'rest-client'
require 'json'
require 'sinatra/activerecord'

class Pokemon < ActiveRecord::Base
  # add your associations and methods here
  belongs_to :player

  def attack
    self.damage += rand(-10..10)
  end

  def take_damage(inc_damage)
    new_defence = rand(defence)
    total_damage = inc_damage - new_defence
    if health >= total_damage
      self.health -= total_damage
    else
      self.health = 0
    end
  end

  def miss?
    rand(200) < speed
  end

  def ko?
    return true if self.health.zero?
  end

  def self.locate_stat(stat_hash, key)
    stat = stat_hash.find { |hash| hash['stat']['name'] == key }
    stat['base_stat']
  end

  def self.details(name)
    url = "https://pokeapi.co/api/v2/pokemon/#{name}"
    response = JSON.parse(RestClient.get(url))
    stats = response['stats']

    {
      name: name,
      health: locate_stat(stats, 'hp'),
      damage: locate_stat(stats, 'attack'),
      defence: locate_stat(stats, 'defense'),
      speed: locate_stat(stats, 'speed'),
      image: response['sprites']['front_default']
    }
  end
end
