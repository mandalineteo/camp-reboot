require 'factory_bot'

require_relative '../config/application'
require_relative '../app/models/game'
require_relative '../app/models/player'
require_relative '../app/models/pokemon'

ActiveRecord::Base.logger = nil
FactoryBot.find_definitions
