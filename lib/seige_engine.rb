class SiegeEngine < Unit

  attr_reader :attack_power, :health_points

  def initialize
    @attack_power = 50
    @health_points = 400
  end

  def attack!(enemy)
    super
    if enemy.class == Barracks
      enemy.damage(self.attack_power * 2)
    elsif enemy.class == SiegeEngine
      enemy.damage(self.attack_power)
    else
      false
    end
  end

  def damage(amount)
    @health_points -= amount
  end
  
end