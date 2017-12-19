# A module to enable spellcastin capibility for all characters.
module CharacterCastSpell
  def check_if_valid_spell(spell_name)
    return @known_spells[spell_name] if @known_spells[spell_name]
    print_error_message("#{spell_name} is not a valid spell.")
    false
  end

  def cast_spell(spell, enemies)
    case spell[:type]
    when 'damage'
      attack_object = cast_damage_spell(spell, enemies)
      attack_object[:spell_dc] = get_spell_dc(spell[:level])
      attack_object[:attack_type] = 'spell'
      attack_object
    end
  end

  def cast_damage_spell(spell, enemies)
    # get target for spell
    # get full damage for spell
    # magic attacks can be resisted by a roll by the receiver
    # so attack object should just contain the spell dc
    # and the damage as well as a message for the battle log.
    target = if spell[:target] == 'all'
               'all'
             else
               get_random_target(enemies)
             end
    damage = get_spell_damage(spell)
    message = ["#{@name} attacks #{enemies[target].name} with #{spell[:name]}!"]
    { target: target, damage: damage, message: message }
  end

  def get_bonus(bonus_to_get)
    if bonus_to_get == 'proficiency'
      @magic_prof
    elsif bonus_to_get == 'level'
      @level
    elsif bonus_to_get == 'magic'
      @mag_modifier
    elsif bonus_to_get == 'charisma'
      @cha_modifier
    elsif bonus_to_get == false
      0
    end
  end

  def check_if_spell_is_resisted(spell_dc, magic_resist, dice_roll = roll_dice(20, 1))
    dice_roll += magic_resist
    return false if dice_roll < spell_dc
    true
  end
end
