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

  new_character = TestCharacter.new('Test Character')
  stat = 8
  new_character.ac = stat
  new_character.attack = stat
  new_character.damage = stat
  new_character.max_hp = stat
  new_character.mag_resist = stat
  new_character.spell_failure_chance = stat
  new_character.dex = stat
  new_character.str = stat
  new_character.con = stat
  new_character.mag = stat
  new_character.cha = stat
  update = 10

  stat_update = { 'ac' => 18, 'attack' => 18, 'damage' => 18, 'max hp' => 18,
                  'magic resist' => 18, 'spell failure' => 100, 'dex' => 18, 'str' => 18,
                  'con' => 18, 'mag' => 18, 'cha' => 18 }

  stat_update.each_pair do |name, result|
    define_method("test_that_attribute_#{name}_updates") do
      assert_equal(result, new_character.update_stat(name, update))
    end
  end
end
