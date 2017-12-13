require 'require_all'
require_rel 'player_character_modules'

module PlayerCharacterModules
  include PlayerCharacterCombat
  include PlayerCharacterInteractions
end