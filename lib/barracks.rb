class Barracks
  attr_reader :gold, :food, :health_points, :lumber
  def initialize
    @gold = 1000
    @food = 80
    @health_points = 500
    @lumber = 500
  end

  def damage(amount)
    @health_points -= amount
  end

  def gold
    @gold
  end

  def food
    @food
  end

  def train_siege_engine
    @gold -= 200
    @food -= 3
    @lumber -= 60
    SiegeEngine.new
  end

  def train_footman
    @gold -= 135
    @food -= 2
    can_train_footman? ? Footman.new : nil
  end

  def train_peasant
    @gold -= 90
    @food -= 5
    can_train_peasant? ? Peasant.new : nil
  end

  def can_train_peasant?
    self.food > 5 && self.gold > 90
  end
  def can_train_footman?
    self.food > 2 && self.gold > 135
  end

  def dead?
    health_points <= 0
  end

end
