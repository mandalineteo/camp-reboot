require_relative '../spec_helper'

describe Game do
  it 'should be able to have many players' do
    game = FactoryBot.create(:game)
    moh = FactoryBot.create(:moh, game: game)
    zohan = FactoryBot.create(:zohan, game:game)

    expect(Game.last.players).to include(moh, zohan)
  end
end
