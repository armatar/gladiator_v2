# A factory to create random characters of a given level.
class RandomCharacterFactory
  def self.randomize(character, level)
    @random_character = character
    max_hash = get_stat_max('magic', 'magic')
    att_hash = randomize_attributes(20, max_hash)
    @random_character.set_base_attributes(att_hash[:str], att_hash[:dex], att_hash[:con],
                                          att_hash[:mag], att_hash[:cha])
    @random_character.calculate_initial_stats
    @random_character
  end

  def self.randomize_attributes(points_to_assign, max_hash)
    attribute_hash = { str: 8, dex: 8, con: 8, mag: 8, cha: 8 }
    until points_to_assign.zero?
      case get_random_number(1, 5)
      when 1
        if check_for_valid_random(max_hash[:str_max], attribute_hash[:str])
          attribute_hash[:str] += 1
          points_to_assign -= 1
        end
      when 2
        if check_for_valid_random(max_hash[:dex_max], attribute_hash[:dex])
          attribute_hash[:dex] += 1
          points_to_assign -= 1
        end
      when 3
        if check_for_valid_random(max_hash[:con_max], attribute_hash[:con])
          attribute_hash[:con] += 1
          points_to_assign -= 1
        end
      when 4
        if check_for_valid_random(max_hash[:mag_max], attribute_hash[:mag])
          attribute_hash[:mag] += 1
          points_to_assign -= 1
        end
      when 5
        if check_for_valid_random(max_hash[:cha_max], attribute_hash[:cha])
          attribute_hash[:cha] += 1
          points_to_assign -= 1
        end
      end
    end
    attribute_hash
  end

  def self.check_for_valid_random(max, attribute)
    return true if (attribute + 1) <= max
    false
  end

  def self.get_random_number(min, max)
    rand(min..max)
  end

  def self.get_stat_max(primary_skill, secondary_skill)
    max_hash = {}
    case primary_skill
    when '1-hand weapon', 'dual wield weapon', '2-hand weapon', 'unarmed weapon'
      max_hash[:str_max] = 99
      max_hash[:dex_max] = 99
      max_hash[:con_max] = 99
      if secondary_skill != 'magic'
        max_hash[:mag_max] = 9
        max_hash[:cha_max] = 12
      else
        max_hash[:mag_max] = 99
        max_hash[:cha_max] = 99
      end
    when 'magic'
      if secondary_skill == 'magic'
        max_hash[:str_max] = 12
        max_hash[:dex_max] = 12
      else
        max_hash[:str_max] = 99
        max_hash[:dex_max] = 99
      end
      max_hash[:con_max] = 99
      max_hash[:mag_max] = 99
      max_hash[:cha_max] = 99
    end
    max_hash
  end
end
