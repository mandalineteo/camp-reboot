require 'factory_bot'

FactoryBot.define do
  factory :valid_pokemon, class: 'Pokemon' do
    name { 'Pikachu' }
    health { 100 }
    damage { 20 }
    defence { 10 }
    speed { 30 }
    image { 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/25.png'}
    association :player, factory: :zohan
  end

  factory :playerless_pokemon, class: 'Pokemon' do
    name { 'Pikachu' }
    health { 100 }
    damage { 20 }
    defence { 10 }
    speed { 30 }
    image { 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/25.png'}
  end

  factory :fast_pokemon, class: 'Pokemon' do
    name { 'Pikachu' }
    health { 100 }
    damage { 20 }
    defence { 10 }
    speed { 150 }
    image { 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/25.png'}
    association :player, factory: :zohan
  end

  factory :zero_health_pokemon, class: 'Pokemon' do
    name { 'Pikachu' }
    health { 0 }
    damage { 20 }
    defence { 10 }
    speed { 30 }
    image { 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/25.png'}
    association :player, factory: :zohan
  end

  factory :zohan, class: 'Player' do
    name { 'Zohan' }
    association :game
  end

  factory :moh, class: 'Player' do
    name { 'Moh' }
    association :game
  end

  factory :game do
  end
end
