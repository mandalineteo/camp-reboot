require_relative '../spec_helper'

describe Player do
  it 'should be able to have many pokemons' do
    game = FactoryBot.create(:game)
    zohan = FactoryBot.create(:zohan, game:game)
    pokemon1 = FactoryBot.create(:playerless_pokemon, player: zohan)
    pokemon2 = FactoryBot.create(:playerless_pokemon, player: zohan)

    expect(Player.last.pokemons).to include(pokemon1, pokemon2)
  end

  it 'should belong to a game' do
    game = FactoryBot.create(:game)
    FactoryBot.create(:moh, game:game)

    expect(Player.last.game).to eq(game)
  end
end
