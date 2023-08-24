require_relative '../spec_helper'

describe Pokemon do
  let(:pokemon) { FactoryBot.build(:valid_pokemon) }
  let(:zero_health_pokemon) { FactoryBot.build(:zero_health_pokemon) }

  # before(:all) do
  #   create_db
  # end

  describe '#initialize' do
    it 'should be initialized with a hash of attributes' do
      expect(pokemon).to be_a(Pokemon)
    end

    it 'should initialize with a name property' do
      expect(pokemon.name).to eq('Pikachu')
    end

    it 'should initialize with a health property' do
      expect(pokemon.health).to be_an(Integer)
    end

    it 'should initialize with a damage property' do
      expect(pokemon.damage).to be_an(Integer)
    end

    it 'should initialize with a defence property' do
      expect(pokemon.defence).to be_an(Integer)
    end

    it 'should initialize with a speed property' do
      expect(pokemon.speed).to be_an(Integer)
    end

    it 'should initialize with a image property' do
      expect(pokemon.image).to be_a(String)
    end

    # it 'should not be able to read the speed attribute' do
    #   expect { pokemon.speed }.to raise_error(NoMethodError)
    # end
  end

  describe '#player' do
    it 'should return the correct association' do
      pokemon = FactoryBot.build(:playerless_pokemon)
      player = FactoryBot.build(:zohan)

      pokemon.player = player
      pokemon.save

      expect(pokemon.player).to eq(player)
    end
  end

  describe '#attack' do
    it 'should return a random number ± 10 from the attack attribute' do
      results = []
      30.times do
        result = pokemon.attack
        expect(result).to be_within(10).of(pokemon.damage)
        results << result
      end

      expect(results.uniq.size).to be > 1
    end
  end

  describe '#take_damage' do
    it 'should reduce the pokemons health' do
      initial_health = pokemon.health
      pokemon.take_damage(20)
      expect(pokemon.health).to be < initial_health
    end

    it 'should reduce some random damage based on defence' do
      results = []

      min_health = pokemon.health - 50

      30.times do
        pokemon_instance = FactoryBot.build(:valid_pokemon)
        pokemon_instance.take_damage(50)
        remaining_health = pokemon_instance.health
        expect(remaining_health).to be_within(min_health).of(pokemon.health)
        results << remaining_health
      end

      expect(results.uniq.length).to be > 1
    end

    it 'should not reduce the health below 0' do
      pokemon.take_damage(500)
      expect(pokemon.health).to eq(0)
    end
  end

  describe '#miss?' do
    it 'should return a random chance of true based upon a factor of speed / 200' do
      fast_results = []
      normal_results = []

      30.times do
        fast_pokemon = FactoryBot.build(:fast_pokemon)
        fast_results << fast_pokemon.miss?
        normal_results << pokemon.miss?
      end

      fast_misses = fast_results.select{ |e| e }.length
      normal_misses = normal_results.select{ |e| e }.length

      expect(fast_misses).to be > normal_misses
    end
  end

  describe '#ko?' do
    it 'should return true if the health is 0' do
      expect(zero_health_pokemon.ko?).to be_truthy
    end
    it 'should return false if the health is more than 0' do
      expect(pokemon.ko?).to be_falsey
    end
  end
end
