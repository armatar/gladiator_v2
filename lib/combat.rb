require_relative 'combat_modules.rb'
require_relative 'ui_modules.rb'

class Combat
  include CombatModules
  include UIModules

  def initialize(allies, enemies)
    @allies = allies
    @enemies = enemies
  end

  def round_one_auto_attack

  end
end