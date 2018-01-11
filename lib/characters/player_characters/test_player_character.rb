require_relative '../player_character.rb'

# A test player character specifically for testing.
# Used to add further writer permissions for clearer tests.
class TestPlayerCharacter < PlayerCharacter
  attr_accessor :max_hp, :max_mana, :inventory, :known_spells, :str, :dex
  def initialize(name)
    super(name)
    @prof_points = 5
  end
end
