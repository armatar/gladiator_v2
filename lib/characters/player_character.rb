require_relative '../character.rb'
require_relative 'player_character_modules.rb'

# Base class for a player character.
# Adds controlable options for player.
class PlayerCharacter < Character
  include PlayerCharacterModules

  def initialize(name)
    super(name)
    @controlled = true
  end
end
