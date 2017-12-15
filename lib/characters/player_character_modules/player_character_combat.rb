module PlayerCharacterCombat
  def create_attack_object(enemies)
    attack_object = select_action(enemies)
    return attack_object
  end

  def select_action(enemies)
    valid_action = false
    while !valid_action
      answer = ask_question("What action do you wish for #{@name} to take?", "Select the number from combat options.")
      case answer
        when "1"
          target = select_target(enemies, "Select a target for #{@name} to attack.", "Enter the name of the enemy to select it.")
          attack_object = {target: target, message: ["#{@name} attacks #{enemies[target].name}!"]}
          attack_object.merge!(auto_attack)
          return attack_object
        when "2"
          print_error_message("Option currently unavailble. Try again.")
        when "3"
          print_error_message("Option currently unavailble. Try again.")
        when "4"
          return get_item_to_use
        else
          print_error_message("Invalid option. Try again.")
      end
    end
  end
end
