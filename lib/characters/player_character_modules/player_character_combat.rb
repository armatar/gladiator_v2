module PlayerCharacterCombat
  def auto_attack(enemies)
    attack = roll_dice(20, 1) + @attack
    damage = roll_dice(6, 1) + @damage
    target = select_target(enemies)
    message = ["#{@name} attacks #{enemies[target].name}!"]
    attack_object = {attack: attack, damage: damage, target: target, message: message}
    return attack_object
  end

  def select_target(enemies)
    valid_target = false
    while !valid_target
      answer = ask_question("Select your target to attack.", "Enter the name of the enemy to select it.")
      enemies.each_with_index do |enemy, index|
        if enemy.name.downcase == answer
          return index
        end
      end
      print_error_message("Invalid target. Try again.")
    end
  end
end