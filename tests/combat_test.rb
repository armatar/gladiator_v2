require_relative '../test_helper.rb'
require_relative "../lib/character.rb"
require_relative "../lib/combat.rb"
require 'byebug'

class CombatTest < MiniTest::Test
  # combat between characters until one side is dead.
  @c1 = Character.new("Ally 1")
  @c2 = Character.new("Ally 2")
  @c3 = Character.new("Ally 3")
  @e1 = Character.new("Enemy 1")
  @e2 = Character.new("Enemy 2")
  @e3 = Character.new("Enemy 3")

  @c1.dead = true
  @e1.dead = true
  combat  = Combat.new([@c1], [@e2])
  combat2 = Combat.new([@c2], [@e1])
  combat3 = Combat.new([@c1], [@e2, @e3])
  combat4 = Combat.new([@c2, @c3], [@e1])

  scenarios_to_test = {"enemies_win" => [combat,  "All allies have died! Enemies win!"],
                       "allies_win" =>  [combat2, "All enemies have died! Allies win!"],
                       "multiple_enemies_win" => [combat3,  "All allies have died! Enemies win!"],
                       "multiple_allies_win"  => [combat4,  "All enemies have died! Allies win!"]}

  scenarios_to_test.each_pair do |name, attributes|                  
      define_method("test_combat_completes_when_#{name}") do
      capture_stdout {attributes[0].fight}
      assert(attributes[0].battle_log.include?(attributes[1]))
    end
  end
end