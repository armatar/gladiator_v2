module PlayerCharacterCombat
  def create_attack_object(enemies)
    target = select_target(enemies)
    msg_and_target = {target: target, message: ["#{@name} attacks #{enemies[target].name}!"]}
    attack_object = auto_attack(enemies)
    attack_object.merge!(msg_and_target)
    return attack_object
  end

  def select_target(enemies)
    valid_target = false
    while !valid_target
      answer = ask_question("Select a target for #{@name} to attack.", "Enter the name of the enemy to select it.")
      enemies.each_with_index do |enemy, index|
        if enemy.name.downcase == answer
          return index
        end
      end
      print_error_message("Invalid target #{answer}. Try again.")
    end
  end
end