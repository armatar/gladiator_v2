require_relative '../test_helper.rb'
require_relative '../lib/character.rb'
require_relative '../lib/combat.rb'
require 'byebug'

# Testing casting spells in combat
class CastSpellTest < MiniTest::Test
  character = Character.new('Test')
  spell = Spells.damage_spells['magic missle']
  attack_object = character.cast_spell(spell, [character])
  should_not_be_nil = { 'target' => attack_object[:target], 'damage' => attack_object[:damage],
                        'attack type' => attack_object[:attack_type],
                        'spell dc' => attack_object[:spell_dc] }

  should_not_be_nil.each do |name, attribute|
    define_method("test_that_#{name}_is_not_nil") do
      refute_nil(attribute)
    end
  end
end
