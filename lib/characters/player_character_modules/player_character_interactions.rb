module PlayerCharacterInteractions

    def valid_target?(valid_targets, target)
    valid_targets.each_with_index do |valid_target, index|
      if valid_target.name.downcase == target
        return index
      end
    end
    print_error_message("Invalid target #{target}. Try again.")
    return false
  end

  def select_target(valid_targets, prompt, tip=nil, options=nil)
    valid_target = false
    while !valid_target
      answer = ask_question(prompt, tip, options)
      valid_target = valid_target?(valid_targets, answer)
    end
    return valid_target
  end

  def use_healing_item(item)
    case item[:target]
      when "any"
        target = select_target(@party, "Who do you want to use the #{item[:name]} on?", 
                 nil, @party.inject([]) {|names, x| names.push(x.name)})
        @party[target].heal(item[:stat], item[:bonus])
      when "ally"
        party_without_player = @party.shift
        target = select_target(party_without_player, "Who do you want to use the #{item[:name]} on?", 
                 party_without_player.inject([]) {|names, x| names.push(x.name)})
        party_without_player[target].heal(item[:stat], item[:bonus])
      when "self"
        heal(item[:stat], item[:bonus])
    end
  end
end