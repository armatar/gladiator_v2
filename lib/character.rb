require 'byebug'
require 'paint'
require_relative 'character_modules.rb'
require_relative 'ui_modules.rb'
require_relative 'items.rb'
require_relative 'spells.rb'

# Character class is the basis of all combatable characters in the game.
# This contains all of the shared attributes between the different
# player and enemey classes.
# Mostly just here as a base with its only real function being
# initializing the class and ensuring that we do not have
# null attributes.
class Character
  include CharacterModules
  include UIModules

  attr_accessor :hp, :mana, :dead, :party, :inventory, :known_spells
  attr_accessor :equipped_weapon, :equipped_shield
  attr_reader :name, :level, :ac, :bab, :max_hp, :init, :max_mana, :controlled
  attr_reader :mag_resist, :cbm, :cbm_def, :shield_bonus, :armor_bonus
  attr_reader :spell_failure_chance, :str, :dex, :con, :mag, :cha
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
    @known_spells = {}
    @party = [self]
    @controlled = false
    @dead = false
    @level = 1
    set_base_attributes
    set_base_prof_points
    set_base_stats
    calculate_initial_stats
  end

  def set_base_attributes(str = 8, dex = 8, con = 8, mag = 8, cha = 8)
    @str = str
    @dex = dex
    @con = con
    @mag = mag
    @cha = cha
  end

  def set_base_prof_points(one_hand = 0, dual_wield = 0, two_hand = 0, unarmed = 0, magic = 0)
    @one_hand_prof = one_hand
    @dual_wield_prof = dual_wield
    @two_hand_prof = two_hand
    @unarmed_prof = unarmed
    @magic_prof = magic
  end

  def set_base_stats
    @equipped_weapon = Items.default_weapon
    @shield_bonus = 0
    @armor_bonus = 0
    @spell_failure_chance = 0
  end

  def join_party(party)
    @party.concat(party)
  end

  def update_stat(stat, points_to_update)
    case stat
    when 'ac'
      @ac += points_to_update
    when 'attack'
      @attack += points_to_update
    when 'damage'
      @damage += points_to_update
    when 'max hp'
      @max_hp += points_to_update
    when 'magic resist'
      @mag_resist += points_to_update
    when 'spell failure'
      points_to_update *= 10
      @spell_failure_chance += points_to_update
      @spell_failure_chance = 100 if @spell_failure_chance > 100
    when 'dex'
      @dex += points_to_update
    when 'str'
      @str += points_to_update
    when 'con'
      @con += points_to_update
    when 'mag'
      @mag += points_to_update
    when 'cha'
      @cha += points_to_update
    when 'one hand prof'
      @one_hand_prof += points_to_update
    when 'dual wield prof'
      @dual_wield_prof += points_to_update
    when 'two hand prof'
      @two_hand_prof += points_to_update
    when 'unarmed prof'
      @unarmed_prof += points_to_update
    when 'magic prof'
      @magic_prof += points_to_update
    end
  end
end
