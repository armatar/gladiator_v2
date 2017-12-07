require 'byebug'
require_relative 'character_modules.rb'

class Character
  include CharacterModules

  attr_reader :name, :level, :ac, :bab, :hp, :max_hp, :init, :mana, :max_mana
  attr_reader :mag_resist, :cbm, :cbm_def, :shield_bonus, :armor_bonus, :spell_failure_chance
  attr_reader :str, :dex, :con, :mag, :cha
  attr_reader :equipped_weapon, :equipped_shield
  attr_reader :str_modifier, :dex_modifier, :con_modifier, :mag_modifier, :cha_modifier
  attr_reader :attack, :one_hand_atk, :dual_wield_atk, :two_hand_atk, :unarmed_atk, :staff_atk
  attr_reader :damage, :one_hand_damage, :dual_wield_damage, :unarmed_damage, :two_hand_damage, :staff_damage
  attr_reader :one_hand_prof, :two_hand_prof, :dual_wield_prof, :unarmed_prof, :magic_prof

  def initialize(name)
    @name = name
    create_character_base
  end

  def create_character_base
    @level = 1
    @str = 8
    @dex = 8
    @con = 8
    @mag = 8
    @cha = 8
    set_base_attributes
    calculate_initial_stats
  end

  def set_base_attributes
    @equipped_weapon = { name: "fists", type: "unarmed weapon", dice: 3, 
      number_of_dice: 1, number_of_attacks: 2, crit: 20, crit_damage: 3, enchantment: 0 }
    @init = 0
    @ac = 0
    @bab = 0
    @hp = 0
    @max_hp = 0
    @mana = 0
    @max_mana = 0
    @mag_resist = 0
    @cbm = 0
    @cbm_def = 0
    @shield_bonus = 0
    @armor_bonus = 0
    @spell_failure_chance = 0
    @str_modifier = 0
    @dex_modifier = 0
    @con_modifier = 0
    @mag_modifier = 0
    @cha_modifier = 0
    @attack = 0
    @damage = 0
    @one_hand_atk = 0
    @dual_wield_atk = 0
    @two_hand_atk = 0
    @unarmed_atk = 0
    @staff_atk = 0
    @one_hand_damage = 0
    @dual_wield_damage = 0
    @two_hand_damage = 0
    @unarmed_damage = 0
    @staff_damage = 0
    @one_hand_prof = 0
    @dual_wield_prof = 0
    @two_hand_prof = 0
    @unarmed_prof = 0
    @magic_prof = 0
  end
end



character = Character.new("Test")