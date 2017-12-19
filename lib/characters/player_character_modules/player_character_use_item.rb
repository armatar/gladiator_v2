# A module to give player character specific options
# for using items.
module PlayerCharacterUseItem
  def choose_item_to_use
    display_inventory(@inventory)
    item = ''
    loop do
      item = ask_question('Which item do you want to use?',
                          'Type "back" to return')
      if @inventory[item]
        break
      elsif item == 'back'
        return false
      else
        print_error_message("#{item.capitalize} is not an item you have.")
      end
    end
    message = ["#{@name} used a #{item}!"]
    message.push(use_item(@inventory[item]))
    { message: message }
  end

  def use_healing_item(item)
    question = "Who do you want to use the #{item[:name]} on?"
    case item[:target]
    when 'any'
      party_use_item(item, @party, question)
    when 'ally'
      without_player = @party.shift
      return party_use_item(item, without_player, question)
    when 'self'
      return heal(item[:stat], item[:bonus])
    end
  end

  def party_use_item(item, party, question)
    options = party.inject([]) { |names, x| names.push(x.name) }
    target = select_target(party, question, nil, options)
    party[target].heal(item[:stat], item[:bonus])
  end
end
