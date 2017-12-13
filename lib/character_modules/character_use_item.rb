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
        heal(item[:stat], item[:bonus])
    end
  end

  def heal(stat, bonus)
    if stat == "hp"
      @hp += bonus
      if @hp > @max_hp
        @hp = @max_hp
      end
    elsif stat == "mana"
      @mana += bonus
      if @mana > @max_mana
        @mana = @max_mana
      end
    end
  end

end