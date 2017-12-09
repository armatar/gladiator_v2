require_relative '../character.rb'
require_relative 'player_character_modules.rb'

class PlayerCharacter < Character
  include PlayerCharacterModules
  
  def initialize(name)
    super(name)
  end
end