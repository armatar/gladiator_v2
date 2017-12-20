# A module to enable choice on casting spells for player characters.
module PlayerCharacterCastSpell
  def select_a_spell(enemies)
    display_known_spells(@known_spells)
    loop do
      spell_name = ask_question('Which spell do you want to cast?', 'Type [back] to return.')
      return false if spell_name == 'back'
      spell = check_if_valid_spell(spell_name)
      attack_object = cast_spell(spell, enemies)
      return attack_object if attack_object
    end
  end

  def cast_damage_spell(spell, enemies)
    target = ''
    if spell[:target] == 'all'
      target = 'all'
      message = ["#{@name} attacks all enemies with #{spell[:name]}!"]
    else
      target = select_target(enemies, 'Which enemy do you want to attack?')
      message = ["#{@name} attacks #{enemies[target].name} with #{spell[:name]}!"]
    end
    damage = get_spell_damage(spell)
    { target: target, damage: damage, message: message }
  end

  def cast_healing_spell(spell)
    if spell[:target] == 'all'
    elsif spell[:target] == 'ally'
    elsif spell[:target] == 'self'
    elsif spell[:target] == 'any'
      target = select_target(@party, 'Who do you want to heal?', nil,
                             @party.inject([]) { |array, member| array.push(member.name) })
      if @party[target].check_if_fully_healed(spell[:attribute])
        print_error_message("#{@name} is already fully healed!")
        return false
      end
      message = "#{@name} heals #{@party[target].name} with #{spell[:name]}!"
      attack_object = @party[target].get_healing(spell)
      attack_object[:message].unshift(message)
      attack_object
    end
  end
end
