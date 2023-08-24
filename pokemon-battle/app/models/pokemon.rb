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
end
