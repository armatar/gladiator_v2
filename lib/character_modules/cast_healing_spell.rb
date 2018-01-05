# A module specifically for character healing spell casting.
module CastHealingSpell
  def get_healing(spell)
    healing = coordinate_healing(spell)
    get_max_healing(healing, @hp, @max_hp)
  end

  def coordinate_healing(spell)
    healing = get_base_spell_healing(spell)
    healing_bonus = spell[:healing_bonus]
    healing = get_full_spell_healing(healing, get_bonus(healing_bonus))
    healing = 1 if healing <= 0
    healing
  end

  def get_base_spell_healing(spell)
    roll_dice(spell[:dice], get_bonus(spell[:number_of_dice]))
  end

  def get_full_spell_healing(base_healing, bonus_healing)
    base_healing + bonus_healing
  end

  def get_max_healing(healing, hp, max_hp)
    return (max_hp - hp) if (hp + healing) > max_hp
    healing
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
