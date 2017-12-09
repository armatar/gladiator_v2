require 'require_all'
require_rel 'character_modules'

module CharacterModules
  include CharacterCalculations
  include CharacterUI
  include CharacterCombat
end