# This module adds in player specific actions
# that are universial to different player
# modules.
module PlayerCharacterInteractions
  def valid_target?(valid_targets, target)
    valid_targets.each_with_index do |valid_target, index|
      return index if valid_target.name.downcase == target
    end
    print_error_message("Invalid target #{target}. Try again.")
    false
  end

  def select_target(valid_targets, prompt, tip = nil, options = nil)
    valid_target = false
    until valid_target
      answer = ask_question(prompt, tip, options)
      valid_target = valid_target?(valid_targets, answer)
    end
    { target: valid_target }
  end
end
