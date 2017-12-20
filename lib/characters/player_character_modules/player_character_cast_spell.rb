# A module to enable choice on casting spells for player characters.
module PlayerCharacterCastSpell
  def select_a_spell(enemies)
    display_known_spells(@known_spells)
    loop do
      spell_name = ask_question('Which spell do you want to cast?')
      spell = check_if_valid_spell(spell_name)
      return cast_spell(spell, enemies) if spell
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
end
