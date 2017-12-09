require_relative '../test_helper.rb'
require_relative "../lib/character.rb"
require_relative "../lib/combat.rb"
require 'byebug'

class CombatTest < MiniTest::Test
  # make sure every character still alive gets a turn
  # make sure dead characters do not get a turn
  # make sure characters can only target live enemies

  c1 = Character.new("PC")
  c2 = Character.new("Ally 1")
  c3 = Character.new("Ally 2")
  e1 = Character.new("Enemy 1")
  e2 = Character.new("Enemy 2")
  e3 = Character.new("Enemy 3")

  @combat = Combat.new([c1, c2, c3], [e1, e2, e3])

  # not really sure how to test any of this. Need to discuss.
end