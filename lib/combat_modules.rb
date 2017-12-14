require 'require_all'
require_rel 'combat_modules'

# A module to contain all combat modules.
# Used to all combat modules in bulk.
module CombatModules
  include CombatUI
  include CombatHelpers
end
