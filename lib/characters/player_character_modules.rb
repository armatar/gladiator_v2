require 'require_all'
require_rel 'player_character_modules'

# A module to contain all player character modules.
# Used to all player character modules in bulk.
module PlayerCharacterModules
  include PlayerCharacterCombat
  include PlayerCharacterInteractions
  include PlayerCharacterUseItem
  include PlayerCharacterCastSpell
end
