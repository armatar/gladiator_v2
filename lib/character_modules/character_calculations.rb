# Calculations for basic character statitistics.
module CharacterCalculations
  def calculate_initial_stats
    update_modifiers
    set_initiative
    set_first_hp(@level, get_hp_range(@con_modifier), @con_modifier)
    calculate_all_variable_stats
  end

  def update_modifiers
    @str_modifier = (@str - 10) / 2
    @dex_modifier = (@dex - 10) / 2
    @con_modifier = (@con - 10) / 2
    @mag_modifier = (@mag - 10) / 2
    @cha_modifier = (@cha - 10) / 2
  end

  def set_initiative
    @init = @dex_modifier
  end

  def set_first_hp(level, range, con_modifier)
    hp = range[1] + con_modifier
    (level - 1).times do
      hp += rand(range[0]..range[1]) + con_modifier
    end
    @hp = hp
    @max_hp = hp
  end

  def get_hp_range(con_modifier)
    max = if con_modifier + 1 < 2
            6
          else
            6 * (con_modifier + 1)
          end
    min = max / 2

    [min, max]
  end

  def calculate_all_variable_stats
    calculate_bab(@level)
    calculate_shield_bonus(@equipped_shield)
    calculate_ac(get_max_dex_bonus_for_ac(@max_dex_bonus_for_ac, @dex_modifier),
                 @shield_bonus, @armor_bonus)
    calculate_weapon_stats
    calculate_magic_resist(@mag_modifier, @cha_modifier, @magic_prof)
    calculate_cbm
    calculate_mana
    update_modifiers
  end

  def calculate_bab(level)
    @bab = (level / 2).floor + 1
  end

  def calculate_ac(allowed_dex, shield_bonus, armor_bonus)
    @ac = allowed_dex + shield_bonus + armor_bonus + 10
  end

  def get_max_dex_bonus_for_ac(max_dex_bonus_for_ac, dex_modifier)
    if !max_dex_bonus_for_ac
      dex_modifier
    else
      max_dex_bonus_for_ac
    end
  end

  def calculate_shield_bonus(equipped_shield)
    @shield_bonus = if equipped_shield
                      equipped_shield[:defense_bonus] +
                        equipped_shield[:enchantment]
                    else
                      0
                    end
  end

  def calculate_weapon_stats
    set_one_hand
    set_dual_wield
    set_two_hand
    set_unarmed
    set_staff
    set_auto_attack(get_weapon_enchantment(@equipped_weapon),
                    get_attack_and_damage_array)
  end

  def set_one_hand
    @one_hand_atk = get_skill_atk(@one_hand_prof)
    @one_hand_damage = get_skill_damage(@one_hand_prof)
  end

  def set_dual_wield
    @dual_wield_atk = get_skill_atk(@dual_wield_prof)
    @dual_wield_damage = get_skill_damage(@dual_wield_prof)
  end

  def set_two_hand
    @two_hand_atk = get_skill_atk(@two_hand_prof)
    damage = get_skill_damage(@two_hand_prof)
    @two_hand_damage = (damage * 1.5).floor
  end

  def set_unarmed
    @unarmed_atk = get_skill_atk(@unarmed_prof)
    @unarmed_damage = get_skill_damage(@unarmed_prof)
  end

  def set_staff
    @staff_atk = get_skill_atk(@magic_prof)
    @staff_damage = get_skill_damage(@magic_prof)
  end

  def get_weapon_enchantment(equipped_weapon)
    equipped_weapon[:enchantment]
  end

  def get_attack_and_damage_array
    attack_and_damage_array = ''
    if @equipped_weapon[:type] == '1-hand weapon'
      attack_and_damage_array = [@one_hand_atk, @one_hand_damage]
    elsif @equipped_weapon[:type] == '2-hand weapon'
      attack_and_damage_array = [@two_hand_atk, @two_hand_damage]
    elsif @equipped_weapon[:type] == 'unarmed weapon'
      attack_and_damage_array = [@unarmed_atk, @unarmed_damage]
    elsif @equipped_weapon[:type] == 'dual wield weapon'
      attack_and_damage_array = [@dual_wield_atk, @dual_wield_damage]
    elsif @equipped_weapon[:type] == 'staff'
      attack_and_damage_array = [@staff_atk, @staff_damage]
    end
    attack_and_damage_array
  end

  def set_auto_attack(weapon_enchantment, attack_and_damage_array)
    @attack = attack_and_damage_array[0] + weapon_enchantment
    @damage = attack_and_damage_array[1] + weapon_enchantment
  end

  def get_skill_atk(skill)
    @bab + @str_modifier + skill
  end

  def get_skill_damage(skill)
    @str_modifier + skill
  end

  def calculate_magic_resist(mag_modifier, cha_modifier, magic_prof)
    @mag_resist = mag_modifier + (cha_modifier / 2).floor + magic_prof
  end

  def calculate_cbm
    @cbm = @bab + @str_modifier + @unarmed_prof
    @cbm_def = 10 + @bab + @str_modifier + @dex_modifier + @unarmed_prof
  end

  def calculate_mana
    mana = (@magic_prof * 50) + (@mag_modifier * 40) +
           (@cha_modifier * 30) + (@level * 20)
    mana = 0 if mana < 0
    @max_mana = mana
    @mana = @max_mana
  end

  def get_spell_dc(spell_level)
    10 + @mag_modifier + (@cha_modifier / 2) + @magic_prof + spell_level
  end
end
