require 'byebug'
require 'paint'
require_relative 'character_modules.rb'
require_relative 'ui_modules.rb'
require_relative 'items.rb'

class Character
  include CharacterModules
  include UIModules

  attr_accessor :hp, :mana, :dead, :party
  attr_reader :name, :level, :ac, :bab, :max_hp, :init, :max_mana, :controlled
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
    @party = [self]
    @controlled = false
    @dead = false
    @level = 1
    @str = 8
    @dex = 8
    @con = 8
    @mag = 8
    @cha = 8
    set_base_attributes
    calculate_initial_stats
    @init = rand(1..5)
  end

  def set_base_attributes
    @equipped_weapon = Items.default_weapon
    @shield_bonus = 0
    @armor_bonus = 0
    @spell_failure_chance = 0
    @one_hand_prof = 0
    @dual_wield_prof = 0
    @two_hand_prof = 0
    @unarmed_prof = 0
    @magic_prof = 0
  end

  def join_party(party)
    @party.concat(party)
    return @party
  end
end