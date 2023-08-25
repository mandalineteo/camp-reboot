require 'rest-client'
require 'json'

class Pokemon < ActiveRecord::Base
  belongs_to :player

  def attack
    rand(10) + damage
  end

  def take_damage(dmg)
    damage_received = dmg - rand(defence)

    if damage_received > health
      self.health = 0
    else
      self.health -= damage_received
    end
  end

  def miss?
    rand(200) < speed
  end

  def ko?
    health.zero?
  end

  def self.details(name)
    url = "https://pokeapi.co/api/v2/pokemon/#{name}"
    response_json = RestClient.get(url, {accept: :json}).body
    response = JSON.parse(response_json)

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

  def self.locate_stat(stats_hash, key)
    stat = stats_hash.find do |hash|
      hash['stat']['name'] == key
    end

    stat ? stat['base_stat'] : 0
  end
end
