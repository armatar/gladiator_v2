require_relative '../test_helper.rb'
require_relative "../lib/character.rb"
require 'byebug'

class CharacterTest < MiniTest::Test

  @character = Character.new("Test Character")

  should_not_be_nil = {"name" => @character.name, "level" => @character.level, "ac" => @character.ac, "bab" => @character.bab, "init" => @character.init,
                       "hp" => @character.hp, "max_hp" => @character.max_hp, "str" => @character.str, "dex" => @character.dex, 
                       "mana" => @character.mana, "max_mana" => @character.max_mana, "mag resist" => @character.mag_resist, "cbm" => @character.cbm,
                       "cbm def" => @character.cbm_def, "shield_bonus" => @character.shield_bonus, "armor bonus" => @character.armor_bonus,
                       "spell_failure_chance" => @character.spell_failure_chance, "equipped weapon" => @character.equipped_weapon, 
                       "con" => @character.con, "mag" => @character.mag, "cha" => @character.cha, "str_modifier" => @character.str_modifier, 
                       "dex_modifier" => @character.dex_modifier, "con_modifier" => @character.con_modifier, 
                       "mag_modifier" => @character.mag_modifier, "cha_modifier" => @character.cha_modifier, 
                       "attack" => @character.attack, "one_hand_atk" => @character.one_hand_atk, "dual_wield_atk" => @character.dual_wield_atk, 
                       "two_hand_atk" => @character.two_hand_atk, "unarmed_atk" => @character.unarmed_atk, "staff_atk" => @character.staff_atk, 
                       "damage" => @character.damage, "one_hand_damage" => @character.one_hand_damage, 
                       "dual_wield_damage" => @character.dual_wield_damage, "unarmed_damage" =>@character.unarmed_damage, 
                       "two_hand_damage" => @character.two_hand_damage, "staff_damage" => @character.staff_damage, 
                       "one_hand_prof" => @character.one_hand_prof, "two_hand_prof" => @character.two_hand_prof, 
                       "dual_wield_prof" => @character.dual_wield_prof, "unarmed_prof" => @character.unarmed_prof, "magic_prof" => @character.magic_prof,
                       "dead" => @character.dead}

  should_not_be_nil.each_pair do |name, attribute|
    define_method("test_#{name}_does_not_return_nill") do
      refute_nil(attribute)
    end
  end

  atk_obj_attributes = {"attack roll" => @character.auto_attack([@character])[:attack], "damage" => @character.auto_attack([@character])[:damage],
                        "target" => @character.auto_attack([@character])[:target], "message" => @character.auto_attack([@character])[:message]}

  atk_obj_attributes.each_pair do |name, attribute|
    define_method("test_#{name}_exists_in_attack_object") do
      refute_nil(attribute)
    end
  end
  test_attack_object = {attack: 1, damage: 1}
  defence_obj_attributes = {"message" => @character.defend(test_attack_object)[:message]}

  defence_obj_attributes.each_pair do |name, attribute|
    define_method("test_#{name}_exists_in_defence_object") do
      refute_nil(attribute)
    end
  end

end