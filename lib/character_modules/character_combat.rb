module CharacterCombat
  def create_attack_object(possible_targets)
    @attack_message = ""
    target = get_random_target(possible_targets)
    msg_and_target = {target: target, message: ["#{@name} attacks #{possible_targets[target].name}!"]}
    attack_object = auto_attack(possible_targets)
    attack_object.merge!(msg_and_target)
    return attack_object
  end

  def roll_dice(dice, number)
    roll_result = 0
    number.times do
      roll_result += rand(1..dice)
    end
    return roll_result
  end

  def auto_attack(possible_targets)
    attack = []
    damage = []
    @equipped_weapon[:number_of_attacks].times do 
      attack.push(roll_dice(20, 1) + @attack)
      damage.push(roll_dice(6, 1) + @damage)
    end
    return {attack: attack, damage: damage}
  end

  def defend(attack_object)
    message = []
    attack_object[:attack].each_with_index do |attack, index|
      if attack >= @ac
        @hp -= attack_object[:damage][index]
        message.push("Hit! #{@name.upcase} takes #{attack_object[:damage][index]} damage!")
      else
        message.push("Miss!")
      end
    end
    if @hp <= 0
      @dead = true
      @hp = 0
      message.push("#{@name.upcase} has died!")
    end
    return {message: message}
  end

  def get_random_target(array)
    invalid = true
    index = nil
    while invalid
      index = rand(0..(array.length-1))
      if !array[index].dead
        invalid = false
      end
    end
    return index
  end
end