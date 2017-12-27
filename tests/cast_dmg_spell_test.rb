require_relative '../test_helper.rb'
require_relative '../lib/characters/test_character.rb'
require 'byebug'

# Testing casting spells in combat
class CastDmgSpellTest < MiniTest::Test
  character = TestCharacter.new('Test')
  enemy = TestCharacter.new('Enemy')
  spell = Spells.damage_spells['magic missle']
  spell2 = Spells.damage_spells['burning hands']

  dmg_should_not_be_nil = { 'target' => :target, 'damage' => :damage,
                            'attack type' => :attack_type,
                            'spell dc' => :spell_dc }

  dmg_should_not_be_nil.each do |name, attribute|
    define_method("test_that_#{name}_is_not_nil_with_single_target") do
      attack_object = character.cast_spell(spell, [enemy], [character])
      refute_nil(attack_object[attribute])
    end
  end

  dmg_should_not_be_nil.each do |name, attribute|
    define_method("test_that_#{name}_is_not_nil_with_target_all") do
      attack_object = character.cast_spell(spell2, [enemy], [character])
      refute_nil(attack_object[attribute])
    end
  end

  sample_atk_object = { target: 'all', damage: 2,
                        message: ['Ally 1 attacks all enemies with burning hands!'],
                        spell_dc: 9, attack_type: 'spell' }
  def_should_not_be_nil = { 'message' => :message }

  def_should_not_be_nil.each do |name, attribute|
    define_method("test_that_#{name}_is_not_nil_in_def_object_with_spell") do
      defense_object = character.decode_attack_object(sample_atk_object)
      refute_nil(defense_object[attribute])
    end
  end
end
