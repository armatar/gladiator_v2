require_relative '../test_helper.rb'
require_relative "../lib/character.rb"

class CharacterTest < Minitest::Test
  def setup
    #@character = Character.new("Test Character")
  end
  @character = Character.new("Test Character")

  should_not_be_nil = {"name" => @character.name, "level" => @character.level, "ac" => @character.ac, "bab" => @character.bab, 
                       "hp" => @character.hp, "max_hp" => @character.max_hp, "str" => @character.str, "dex" => @character.dex, 
                       "con" => @character.con, "mag" => @character.mag, "cha" => @character.cha, "str_modifier" => @character.str_modifier, 
                       "dex_modifier" => @character.dex_modifier, "con_modifier" => @character.con_modifier, 
                       "mag_modifier" => @character.mag_modifier, "cha_modifier" => @character.cha_modifier, 
                       "attack" => @character.attack, "one_hand_atk" => @character.one_hand_atk, "dual_wield_atk" => @character.dual_wield_atk, 
                       "two_hand_atk" => @character.two_hand_atk, "unarmed_atk" => @character.unarmed_atk, "staff_atk" => @character.staff_atk, 
                       "damage" => @character.damage, "one_hand_damage" => @character.one_hand_damage, 
                       "dual_wield_damage" => @character.dual_wield_damage, "unarmed_damage" =>@character.unarmed_damage, 
                       "two_hand_damage" => @character.two_hand_damage, "staff_damage" => @character.staff_damage, 
                       "one_hand_prof" => @character.one_hand_prof, "two_hand_prof" => @character.two_hand_prof, 
                       "dual_wield_prof" => @character.dual_wield_prof, "unarmed_prof" => @character.unarmed_prof, "magic_prof" => @character.magic_prof}

  should_not_be_nil.each_pair do |name, attribute|
    define_method("test_#{name}_does_not_return_nill") do
      refute_nil(attribute)
    end
  end

end