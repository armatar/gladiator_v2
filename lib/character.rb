require 'byebug'
require 'paint'
require_relative 'character_modules.rb'
require_relative 'ui_modules.rb'
require_relative 'items.rb'

# Character class is the basis of all combatable characters in the game.
# This contains all of the shared attributes between the different
# player and enemey classes.
# Mostly just here as a base with its only real function being
# initializing the class and ensuring that we do not have
# null attributes.
class Character
  include CharacterModules
  include UIModules

  attr_accessor :hp, :mana, :dead, :party, :inventory
  attr_reader :name, :level, :ac, :bab, :max_hp, :init, :max_mana, :controlled
  attr_reader :mag_resist, :cbm, :cbm_def, :shield_bonus, :armor_bonus
  attr_reader :spell_failure_chance, :str, :dex, :con, :mag, :cha
  attr_reader :equipped_weapon, :equipped_shield
  attr_reader :str_modifier, :dex_modifier, :con_modifier, :mag_modifier
  attr_reader :cha_modifier, :staff_atk, :staff_damage
  attr_reader :attack, :one_hand_atk, :dual_wield_atk, :two_hand_atk
  attr_reader :unarmed_atk, :two_hand_damage, :magic_prof
  attr_reader :damage, :one_hand_damage, :dual_wield_damage, :unarmed_damage
  attr_reader :one_hand_prof, :two_hand_prof, :dual_wield_prof, :unarmed_prof

  def initialize(name)
    @name = name
    create_character_base
  end

  def create_character_base
    @inventory = {}
    @party = [self]
    @controlled = false
    @dead = false
    @level = 1
    set_base_attributes
    set_base_stats
    calculate_initial_stats
    @init = rand(1..5)
  end

  def set_base_attributes
    @str = 8
    @dex = 8
    @con = 8
    @mag = 8
    @cha = 8
  end

  def set_base_stats
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
  end
end
