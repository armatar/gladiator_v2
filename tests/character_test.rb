require_relative '../test_helper.rb'
require_relative '../lib/characters/test_character.rb'
require 'byebug'

# CharacterTest just tests to ensure that all of the
# attributes expected of a character are there and not nil.
# This includes objects that the character should be able
# to create, like attack and defence objects.
class CharacterTest < MiniTest::Test
  @character = TestCharacter.new('Test Character')

  not_nil = { 'name' => @character.name, 'level' => @character.level,
              'ac' => @character.ac, 'bab' => @character.bab,
              'init' => @character.init, 'hp' => @character.hp,
              'max_hp' => @character.max_hp, 'str' => @character.str,
              'dex' => @character.dex, 'mana' => @character.mana,
              'max_mana' => @character.max_mana, 'cbm' => @character.cbm,
              'mag resist' => @character.mag_resist, 'con' => @character.con,
              'cbm def' => @character.cbm_def, 'mag' => @character.mag,
              'shield_bonus' => @character.shield_bonus,
              'armor bonus' => @character.armor_bonus,
              'spell_failure_chance' => @character.spell_failure_chance,
              'equipped weapon' => @character.equipped_weapon,
              'cha' => @character.cha, 'str_mod' => @character.str_modifier,
              'dex_mod' => @character.dex_modifier,
              'con_mod' => @character.con_modifier,
              'mag_mod' => @character.mag_modifier,
              'cha_mod' => @character.cha_modifier,
              'attack' => @character.attack, 'damage' => @character.damage,
              'one_hand_atk' => @character.one_hand_atk,
              'dual_wield_atk' => @character.dual_wield_atk,
              'two_hand_atk' => @character.two_hand_atk,
              'unarmed_atk' => @character.unarmed_atk,
              'staff_atk' => @character.staff_atk,
              'one_hand_damage' => @character.one_hand_damage,
              'dual_wield_damage' => @character.dual_wield_damage,
              'unarmed_damage' => @character.unarmed_damage,
              'two_hand_damage' => @character.two_hand_damage,
              'staff_damage' => @character.staff_damage,
              'one_hand_prof' => @character.one_hand_prof,
              'two_hand_prof' => @character.two_hand_prof,
              'dual_wield_prof' => @character.dual_wield_prof,
              'unarmed_prof' => @character.unarmed_prof,
              'magic_prof' => @character.magic_prof,
              'dead' => @character.dead, 'party' => @character.party,
              'inventory' => @character.inventory }

  not_nil.each_pair do |name, attribute|
    define_method("test_#{name}_does_not_return_nill") do
      refute_nil(attribute)
    end
  end

  atk_obj = { 'atk roll' => @character.create_attack_object([@character])[:attack],
              'damage' => @character.create_attack_object([@character])[:damage],
              'target' => @character.create_attack_object([@character])[:target],
              'message' => @character.create_attack_object([@character])[:message] }

  atk_obj.each_pair do |name, attribute|
    define_method("test_#{name}_exists_in_attack_object") do
      refute_nil(attribute)
    end
  end
  test_attack_object = { attack: [1], damage: [1] }
  defence_obj = { 'message' => @character.defend(test_attack_object)[:message] }

  defence_obj.each_pair do |name, attribute|
    define_method("test_#{name}_exists_in_defence_object") do
      refute_nil(attribute)
    end
  end
end
