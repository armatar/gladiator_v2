# This module enables a player character to be created by the user
module CreateCharacter
  def create_character
    # update attributes
    # pick profs
    error = nil
    loop do
      create_character_display
      print_error_message(error) if error
      error = nil
      case ask_question('Which would you like to update?', 'Type [done] when you are finished.',
                        %w(attributes proficiencies))
      when 'attributes', '[attributes]'
        update_attributes
      when 'proficiencies', '[proficiencies]'
        update_proficiencies
      when 'done', '[done]'
        break
      else
        error = 'Please select from the options provided.'
      end
    end
  end

  def update_value(value_string, point_string, num_to_update)
    update_stat(value_string, num_to_update)
    self.send("#{point_string}=", num_to_update) if num_to_update
  end

  def update_attributes
    error = nil
    loop do
      clear_screen
      display_attributes_with_points
      attribute_definitions
      print_error_message(error) if error
      error = nil
      case ask_question('Which attribute did you want to edit?', 'Type [back] to return.')
      when 'str', 'strength'
        num_to_update = get_number_to_update(@str, 18, 8, @att_points)
        update_value('str', 'att_points', num_to_update)
      when 'con', 'constitution'
        num_to_update = get_number_to_update(@con, 18, 8, @att_points)
        update_value('con', 'att_points', num_to_update)
      when 'dex', 'dexterity'
        num_to_update = get_number_to_update(@dex, 18, 8, @att_points)
        update_value('dex', 'att_points', num_to_update)
      when 'mag', 'magic'
        num_to_update = get_number_to_update(@mag, 18, 8, @att_points)
        update_value('mag', 'att_points', num_to_update)
      when 'cha', 'charisma'
        num_to_update = get_number_to_update(@cha, 18, 8, @att_points)
        update_value('cha', 'att_points', num_to_update)
      when 'back', '[back]'
        break
      else
        error = 'Not a valid option. Pick from the provided attributes.'
      end
      calculate_all_variable_stats
    end
  end

  def update_proficiencies
    error = nil
    loop do
      clear_screen
      display_profs_with_points
      prof_definitions
      print_error_message(error) if error
      error = nil
      case ask_question('Which proficiency did you want to edit?', 'Type [back] to return.')
      when 'one handed'
        num_to_update = get_number_to_update(@one_hand_prof, 10, 0, @prof_points)
        update_value('one hand prof', 'prof_points', num_to_update)
      when 'dual wield'
        num_to_update = get_number_to_update(@dual_wield_prof, 10, 0, @prof_points)
        update_value('dual wield prof', 'prof_points', num_to_update)
      when 'two handed'
        num_to_update = get_number_to_update(@two_hand_prof, 10, 0, @prof_points)
        update_value('two hand prof', 'prof_points', num_to_update)
      when 'unarmed'
        num_to_update = get_number_to_update(@unarmed_prof, 10, 0, @prof_points)
        update_value('unarmed prof', 'prof_points', num_to_update)
      when 'magic'
        num_to_update = get_number_to_update(@magic_prof, 10, 0, @prof_points)
        update_value('magic prof', 'prof_points', num_to_update)
      when 'back'
        break
      else
        error = 'Not a valid option. Pick from the provided proficiencies.'
      end
      calculate_all_variable_stats
    end
  end

  def get_number_to_update(current, max, min, available_points)
    error = nil
    loop do
      print_error_message(error) if error
      error = nil
      num_to_update = ask_question('How many points do you want to update?',
                                   "Add a negative number to subtract!\nType [back] to return.")
      if /\A[-+]?\d+\z/ === num_to_update 
        result = current + num_to_update.to_i
        if result > max
          error = "Can't go that high. Max: #{max}"
        elsif result < min
          error = "Can't go that low. Min: #{min}"
        elsif (available_points - num_to_update.to_i) < 0
          error = "Don't have enough points!"
        else
          return num_to_update.to_i
        end
      elsif num_to_update == 'back' || num_to_update == '[back]'
        return false
      else
        error = 'You must enter a number.'
      end
    end
  end
end
