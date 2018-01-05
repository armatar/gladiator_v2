# A module specifically for player-character specific UI
module PlayerCharacterUI
  def create_character_display
    clear_screen
    print_line
    puts ''.ljust(5) + Paint['C R E A T E  Y O U R  C H A R A C T E R', :bold, :underline]
    display_attributes_with_points
    new_line
    display_profs_with_points
  end

  def display_attributes_with_points
    print_line
    puts Paint['Attributes', :bold]
    print_line
    display_attributes
    puts Paint['Available Attribute Points: '.ljust(5), :bold] + @att_points.to_s
  end

  def display_profs_with_points
    print_line
    puts Paint['Proficiencies', :bold]
    print_line
    display_profs
    puts Paint['Available Proficiency Points: '.ljust(5), :bold] + @prof_points.to_s
  end

  def attribute_definitions
    print_line
    puts Paint['Strength:'.ljust(15), :italic, :white] + 'Affects physical attack chance and ' \
         'damage as combat maneuver attack and defence.'
    puts Paint['Dexterity:'.ljust(15), :italic, :white] + 'Affects ac, initiative and combat ' \
         'maneuver defence.'
    puts Paint['Constitution:'.ljust(15), :italic, :white] + 'Affects HP.'
    puts Paint['Magic:'.ljust(15), :italic, :white] + 'Primary casting skill. Affects magic' \
        'resist mana pool, and spell dc.'
    puts Paint['Charisma:'.ljust(15), :italic, :white] + 'Secondary casting skill. Affects magic ' \
         'resist, mana pool, and spell dc.'
  end

  def prof_definitions
    print_line
    puts Paint['One Handed:'.ljust(15), :italic, :white] + 'Proficiency with one handed weapons ' \
         'and shields.'
    puts Paint['Dual Wield:'.ljust(15), :italic, :white] + 'Proficiency with dual wielding. Dual ' \
         'wield weapons provide two attacks per turn.'
    puts Paint['Two Handed:'.ljust(15), :italic, :white] + 'Proficiency with two handed weapons. ' \
         'Two handed weapons do damage and a half on hit.'
    puts Paint['Unarmed:'.ljust(15), :italic, :white] + 'Proficiency with fist weapons and ' \
         'combat manuevers. When unarmed, it provides two attacks per turn.'
    puts Paint['Magic:'.ljust(15), :italic, :white] + 'Proficiency with casting spells, mana ' \
         'pool and effectivness when wielding a staff.'
  end
end
