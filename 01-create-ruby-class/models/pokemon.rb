
class Pokemon
  attr_reader :name

  def initialize(attributes = {})
    @name = attributes[:name]
    @health = attributes[:health]
    @damage = attributes[:damage]
    @defence = attributes[:defence]
    @speed = attributes[:speed]
  end

  def attack
    rand(10) + @damage
  end

  def take_damage(damage)
    damage_received = damage - rand(@defence)

    if damage_received > @health
      @health = 0
    else
      @health -= damage_received
    end
  end

  def miss?
    rand(200) < @speed
  end

  def ko?
    @health.zero?
  end
end
