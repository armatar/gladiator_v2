# A module specifically for character healing spell casting.
module CastHealingSpell
  def get_healing(spell)
    healing = coordinate_healing(spell)
    get_max_healing(healing, @hp, @max_hp)
  end

  def coordinate_healing(spell)
    dice_bonus = spell[:number_of_dice_bonus]
    healing = get_base_spell_healing(spell, get_bonus(dice_bonus))
    healing_bonus = spell[:healing_bonus]
    get_full_spell_healing(healing, get_bonus(healing_bonus))
  end

  def get_base_spell_healing(spell, bonus)
    number_of_dice = spell[:number_of_dice] + bonus
    roll_dice(spell[:dice], number_of_dice)
  end

  def get_full_spell_healing(base_healing, bonus_healing)
    base_healing + bonus_healing
  end

  def get_max_healing(healing, hp, max_hp)
    healing = max_hp - hp if (hp + healing) > max_hp
    { healing: healing, message: ["#{@name} is healed by #{healing} points."] }
  end

  def check_if_fully_healed(attribute)
    if attribute == 'hp'
      return true if @hp >= @max_hp
      false
    elsif attribute == 'mana'
      return true if @mana >= @max_mana
      false
    end
  end
end
