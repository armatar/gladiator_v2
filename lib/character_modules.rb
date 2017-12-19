require 'require_all'
require_rel 'character_modules'

# A module to contain all character modules.
# Used to all character modules in bulk.
module CharacterModules
  include CharacterCalculations
  include CharacterUI
  include CharacterCombat
  include CharacterUseItem
  include CharacterCastSpell
  include CastDamageSpell
end
