require_relative 'lib/character.rb'
require_relative 'lib/characters/player_character.rb'
require_relative 'lib/combat.rb'
require_relative 'lib/spells.rb'
require_relative 'lib/factories/random_character_factory.rb'
require_relative 'lib/game.rb'

# character5 = Character.new('Enemy 3')
# character6 = Character.new('Ally 3')
#character2.print_character_sheet
=begin
#character1.inventory = { 'health potion' => { name: 'health potion',
                                              type: 'healing',
                                              stat: 'hp',
                                              bonus: 20,
                                              target: 'any',
                                              price: 10 } }

#character1.known_spells.merge!(Spells.damage_spells)
#character2.known_spells.merge!(Spells.damage_spells)
#character1.known_spells.merge!(Spells.healing_spells)
#character2.known_spells.merge!(Spells.healing_spells)

#puts character1.max_hp
character1 = RandomCharacterFactory.randomize(1, 'PC', true)
character2 = RandomCharacterFactory.randomize(1, 'Ally 1', true)
character3 = RandomCharacterFactory.randomize(1, 'Enemy 1', false)
character4 = RandomCharacterFactory.randomize(1, 'Enemy 2', false)

character2.party = character1.join_party(character2.party).reverse

character1.print_character_sheet

combat = Combat.new(character2.party, [character3, character4])

combat.fight
=end

#game = Game.new
#game.start

character = PlayerCharacter.new('Name')
character.create_character