# A module to enable choice on casting spells for player characters.
module PlayerCharacterCastSpell
  def select_a_spell(enemies)
    display_known_spells(@known_spells)
    loop do
      spell_name = ask_question('Which spell do you want to cast?', 'Type [back] to return.')
      return false if spell_name == 'back'
      puts spell_name
      spell = check_if_valid_spell(spell_name)
      attack_object = cast_spell(spell, enemies, @party) if spell
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

  def cast_healing_spell(spell, party)
    message = []
    if spell[:target] == 'all'
      party.each do |member|
        message.push(cast_healing_helper(member, spell))
      end
    elsif spell[:target] == 'ally'
      without_player = party.dup
      without_player.shift
      target = select_target(without_player, 'Who do you want to heal?', nil,
                             without_player.inject([]) { |array, member| array.push(member.name) })
      message = cast_healing_helper(without_player[target], spell)
    elsif spell[:target] == 'self'
      message = cast_healing_helper(self, spell)
    elsif spell[:target] == 'any'
      target = select_target(party, 'Who do you want to heal?', nil,
                             party.inject([]) { |array, member| array.push(member.name) })
      cast_healing_helper(party[target], spell)
    end
    return false unless message
    { message: message }
  end
end
