require 'active_record'
require_relative '../../models/pokemon'

describe Pokemon do
  name = 'Pikachu'
  health = 100
  damage = 20
  defence = 10
  speed = 30

  valid_properties = { name: name, health: health, damage: damage, defence: defence, speed: speed }
  fast_speed = { **valid_properties, speed: 150 }
  zero_health_properties = { **valid_properties, health: 0}

  pokemon = Pokemon.new(valid_properties)

  describe "#initialize" do

    it 'should be initialized with a hash of attributes' do
      expect(pokemon).to be_a(Pokemon)
    end

    it 'should allow it\'s name to be readable' do
      expect(pokemon.name).to eq("Pikachu")
    end

    it 'should initialize with a health attribute' do
      expect(pokemon.instance_variable_get(:@health)).to eq(health)
    end

    it 'should not be able to read the health attribute' do
      expect { pokemon.health }.to raise_error(NoMethodError)
    end

    it 'should initialize with a damage attribute' do
      expect(pokemon.instance_variable_get(:@damage)).to eq(damage)
    end

    it 'should not be able to read the damage attribute' do
      expect { pokemon.damage }.to raise_error(NoMethodError)
    end

    it 'should initialize with a defence attribute' do
      expect(pokemon.instance_variable_get(:@defence)).to eq(defence)
    end

    it 'should not be able to read the defence attribute' do
      expect { pokemon.defence }.to raise_error(NoMethodError)
    end

    it 'should initialize with a speed attribute' do
      expect(pokemon.instance_variable_get(:@speed)).to eq(speed)
    end

    it 'should not be able to read the speed attribute' do
      expect { pokemon.speed }.to raise_error(NoMethodError)
    end
  end

  describe "#attack" do
    it 'should return a random number ± 10 from the attack attribute' do
      results = []
      30.times do
        result = pokemon.attack
        expect(result).to be_within(10).of(damage)
        results << result
      end

      expect(results.uniq.size).to be > 1
    end
  end

  describe "#take_damage" do
    it 'should reduce the pokemons health' do
      pokemon.take_damage(20)
      expect(pokemon.instance_variable_get(:@health)).to be < health
    end

    it 'should reduce some random damage based on defence' do
      results = []

      min_health = health - 50

      30.times do
        pokemon_instance = Pokemon.new(valid_properties)
        pokemon_instance.take_damage(50)
        remaining_health = pokemon_instance.instance_variable_get(:@health)
        expect(remaining_health).to be_within(min_health).of(health)
        results << remaining_health
      end

      expect(results.uniq.length).to be > 1
    end

    it 'should not reduce the health below 0' do
      pokemon.take_damage(500)
      expect(pokemon.instance_variable_get(:@health)).to eq(0)
    end
  end

  describe "#miss?" do
    it 'should return a random chance of true based upon a factor of speed / 200' do
      fast_results = []
      normal_results = []

      30.times do
        fast_pokemon = Pokemon.new(fast_speed)
        fast_results << fast_pokemon.miss?
        normal_results << pokemon.miss?
      end

      fast_misses = fast_results.select{ |e| e }.length
      normal_misses = normal_results.select{ |e| e }.length

      expect(fast_misses).to be > normal_misses
    end
  end

  describe "#ko?" do
    it "should return true if the health is 0" do
      knocked_out_pokemon = Pokemon.new(zero_health_properties)
      expect(knocked_out_pokemon.ko?).to be_truthy
    end
    it "should return false if the health is more than 0" do
      pokemon = Pokemon.new(valid_properties)
      expect(pokemon.ko?).to be_falsey
    end
  end
end
