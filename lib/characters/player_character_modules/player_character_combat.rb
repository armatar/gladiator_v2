# Module to give basic user based functionality to player character combat
# scenarios. Actually allows for choice instead of ai driven interactions.
module PlayerCharacterCombat
  def create_attack_object(enemies)
    select_action(enemies)
  end

  def select_action(enemies)
    loop do
      answer = ask_question("What action do you wish for #{@name} to take?",
                            'Select the number from combat options.')
      case answer
      when '1'
        attack_object = select_target(enemies,
                                      "Select a target for #{@name} to attack.",
                                      'Enter the name of the enemy to target.')
        target = attack_object[:target]
        attack_object[:message] = ["#{@name} attacks #{enemies[target].name}!"]
        attack_object.merge!(auto_attack)
        return attack_object
      when '2'
        print_error_message('Option currently unavailble. Try again.')
      when '3'
        print_error_message('Option currently unavailble. Try again.')
      when '4'
        response = choose_item_to_use
        return response if response
      else
        print_error_message('Invalid option. Try again.')
      end
    end
  end
end
