module CharacterCombat
  def create_attack_object(possible_targets)
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
    attack = roll_dice(20, 1) + @attack
    damage = roll_dice(6, 1) + @damage
    return {attack: attack, damage: damage}
  end

  def defend(attack_object)
    if attack_object[:attack] >= @ac
      @hp -= attack_object[:damage]
      message = ["Hit! #{@name.upcase} takes #{attack_object[:damage]} damage!"]
      if @hp <= 0
        @dead = true
        @hp = 0
        message.push("#{@name.upcase} has died!")
      end
      return {message: message}
    else
      return {message: "Miss!"}
    end
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