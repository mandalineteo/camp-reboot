require_relative "../config/application"
require 'factory_bot'
require_relative '../app/models/game'
require_relative '../app/models/player'
require_relative '../app/models/pokemon'

ActiveRecord::Base.logger = nil
FactoryBot.find_definitions

ENV['RACK_ENV'] ||= 'development'

def create_db
  config = ActiveRecord::Base.configurations.configs_for(env_name: 'test')[0]
  # p config
  ActiveRecord::Tasks::DatabaseTasks.create(config)
  # ActiveRecord::Base.establish_connection(:development)
end

def drop_db
  config = ActiveRecord::Base.configurations.configs_for(env_name: 'test')[0]
  ActiveRecord::Tasks::DatabaseTasks.drop(config)
end
