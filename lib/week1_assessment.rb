# Put your code here to make the tests pass

class Weapon

  attr_reader :name, :damage

  def initialize(name, damage)
    @name = name
    @damage = damage
  end 

end

class BattleBot

  attr_reader :name, :health, :weapon, :enemies
  @@bot_count = 0

  def initialize(name)

    @name = name
    @health = 100
    @weapon = nil
    @enemies = []
    @@bot_count += 1

  end

  def self.count

    @@bot_count

  end

  def dead?
    @health <= 0
  end

  def pick_up(weapon)

    @weapon ||= weapon

  end

  def drop_weapon

    @weapon = nil

  end

  def attack(victim)

    raise "You do not have a weapon." unless @weapon

    raise ArgumentError.new("You can attack another bot only") unless victim.is_a?(BattleBot)

    victim.take_damage(@weapon.damage)
    victim.add_enemy(self)

  end

  def take_damage(damage)

    @health -= damage
    dead?

  end

  def add_enemy(attacker)

      @enemies << attacker unless @enemies.include?(attacker)

  end

end
