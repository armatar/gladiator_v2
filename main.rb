require_relative 'lib/character.rb'
require_relative 'lib/characters/player_character.rb'
require_relative 'lib/combat.rb'
require_relative 'lib/spells.rb'

character1 = PlayerCharacter.new('PC')
character2 = PlayerCharacter.new('Ally 1')
character3 = Character.new('Enemy 1')
character4 = Character.new('Enemy 2')
# character5 = Character.new('Enemy 3')
# character6 = Character.new('Ally 3')

character2.party = character1.join_party([character2])
character2.print_character_sheet

character1.inventory = { 'health potion' => { name: 'health potion',
                                              type: 'healing',
                                              stat: 'hp',
                                              bonus: 20,
                                              target: 'any',
                                              price: 10 } }
character1.known_spells.merge!(Spells.damage_spells)
character2.known_spells.merge!(Spells.damage_spells)
character1.known_spells.merge!(Spells.healing_spells)
character2.known_spells.merge!(Spells.healing_spells)

combat = Combat.new(character1.party, [character3, character4])

combat.fight
