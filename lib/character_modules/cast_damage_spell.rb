# A module specifically for character damage spell casting.
module CastDamageSpell
  def get_spell_damage(spell)
    bonus_missles = spell[:bonus_missles]
    loop_through_missles(spell, get_bonus(bonus_missles))
  end

  def get_base_spell_damage(spell, bonus)
    number_of_dice = spell[:number_of_dice] + bonus
    roll_dice(spell[:dice], number_of_dice)
  end

  def get_full_spell_damage(base_damage, bonus_damage)
    base_damage + bonus_damage
  end

  def ensure_damage_is_positive(damage)
    return 0 if damage < 0
    damage
  end

  def coordinate_damage(spell)
    dice_bonus = spell[:number_of_dice_bonus]
    base_damage = get_base_spell_damage(spell, get_bonus(dice_bonus))
    damage_bonus = spell[:damage_bonus]
    damage = get_full_spell_damage(base_damage, get_bonus(damage_bonus))
    ensure_damage_is_positive(damage)
  end

  def loop_through_missles(spell, number_of_missles)
    damage = 0
    number_of_missles = 1 if number_of_missles.zero?
    number_of_missles.times do
      damage += coordinate_damage(spell)
    end
    damage
  end
end
