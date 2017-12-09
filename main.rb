require_relative "lib/character.rb"
require_relative "lib/characters/player_character.rb"
require_relative "lib/combat.rb"

character1 = PlayerCharacter.new("PC")
character2 = PlayerCharacter.new("Ally 1")
character3 = Character.new("Enemy 1")
character4 = Character.new("Enemy 2")
character5 = Character.new("Enemy 3")
character6 = Character.new("Ally 3")


combat = Combat.new([character1, character2, character6], [character3, character4, character5])

combat.auto_combat