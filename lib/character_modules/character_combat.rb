module CharacterCombat
  def create_attack_object(possible_targets)
    @attack_message = ''
    target = get_random_target(possible_targets)
    msg_and_target = { target: target,
                       message: ["#{@name} attacks #{possible_targets[target].name}!"] }
    attack_object = auto_attack
    attack_object.merge!(msg_and_target)
  end

  def roll_dice(dice, number)
    roll_result = 0
    number.times do
      roll_result += rand(1..dice)
    end
    roll_result
  end

  def auto_attack
    attack = []
    damage = []
    @equipped_weapon[:number_of_attacks].times do
      attack.push(roll_dice(20, 1) + @attack)
      damage.push(roll_dice(6, 1) + @damage)
    end
    { attack: attack, damage: damage, attack_type: 'auto attack' }
  end

  def decode_attack_object(attack_object)
    case attack_object[:attack_type]
    when 'auto attack'
      defend_auto_attack(attack_object)
    when 'spell'
      defend_spell(attack_object)
    end
  end

  def defend_spell(attack_object)
    message = []
    if check_if_spell_is_resisted(attack_object[:spell_dc], @mag_resist)
      message.push("#{@name} resisted the spell!")
    else
      message.push("#{@name} fails to resist the spell!")
      message = take_damage(attack_object[:damage])
    end
    { message: message }
  end

  def defend_auto_attack(attack_object)
    message = []
    attack_object[:attack].each_with_index do |attack, index|
      if attack >= @ac
        message = take_damage(attack_object[:damage][index])
      else
        message.push('Miss!')
      end
    end
    { message: message }
  end

  def take_damage(damage)
    message =[]
    @hp -= damage
    message.push("Hit! #{@name.upcase} takes #{damage} damage!")
    if @hp <= 0
      @dead = true
      @hp = 0
      message.push("#{@name.upcase} has died!")
    end
    message
  end

  def get_random_target(array)
    invalid = true
    index = nil
    while invalid
      index = rand(0..(array.length - 1))
      invalid = false unless array[index].dead
    end
    index
  end
end
