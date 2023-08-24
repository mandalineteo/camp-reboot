require_relative '../../models/player'

describe Player do

  valid_properties = { name: 'Zohan'}
  player = Player.new(valid_properties)

  describe "#initialize" do
    it 'should be initialized with a hash of attributes' do
      expect(player).to be_a(Player)
    end

    it 'should it\'s name to be readable' do
      expect(player.name).to eq('Zohan')
    end
  end
end
