require_relative '../character.rb'
require_relative 'player_character_modules.rb'

# Base class for a player character.
# Adds controlable options for player.
class PlayerCharacter < Character
  include PlayerCharacterModules

  attr_accessor :att_points, :prof_points

  def initialize(name)
    super(name)
    @controlled = true
    @att_points = 20
    @prof_points = 1
  end
end
