module CharacterUseItem
  def use_item(item)
    case item[:type]
      when "healing"
        use_healing_item(item)
    end
  end

  def use_healing_item(item)
    # defer to specific child classes for ai or offered choice
    case item[:target]
      when "any"
      when "ally"
      when "self"
        heal(item[:stat], get_item_heal_bonus(item[:bonus]))
    end
  end

  def get_item_heal_bonus(bonus)
    if bonus == 'full'
      @max_hp
    elsif bonus == 'half'
      @max_hp / 2
    elsif bonus == 'quarter'
      @max_hp / 4
    else
      bonus
    end
  end

  def heal(stat, bonus)
    diff_stat = 0
    if stat == "hp"
      prev_stat = @hp
      @hp += bonus
      if @hp > @max_hp
        @hp = @max_hp
      end
      diff_stat = @hp - prev_stat
    elsif stat == "mana"
      prev_stat = @mana
      @mana += bonus
      if @mana > @max_mana
        @mana = @max_mana
      end
      diff_stat = @mana - prev_stat
    end
    return ["#{@name}'s #{stat} was healed by #{diff_stat} points."]
  end

end