module CharacterCombat
  def roll_dice(dice, number)
    roll_result = 0
    number.times do
      roll_result += rand(1..dice)
    end
    return roll_result
  end

  def auto_attack
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
        message.push("#{@name.upcase} has died!")
      end
      return message
    else
      return ["Miss!"]
    end
  end
end