require_relative 'ui_modules/game_ui.rb'
require_relative 'ui_modules/basic_ui.rb'
require_relative 'characters/player_character.rb'

# Class to actually start the game from a player perspective.
class Game
  include GameUI
  include BasicUI

  def start
    start_menu
    loop do
      case ask_question('What would you like to do?')
      when 'new game', 'new'
        new_game
      when 'load game', 'load'
        print_error_message('Not currently an availble option')
      when 'exit'
        goodbye_screen
        break
      else
        print_error_message('Please pick from the menu above.')
      end
    end
  end

  def new_game
    name = ask_question('Please select a name for your character.')
    @character = PlayerCharacter.new(name.upcase)
    @character.create_character
  end

  def play
    main_menu
    loop do
      case ask_question('What would you like to do?')
      when 'fight'
        new_game
      when 'shop'
        print_error_message('Not currently an availble option')
      when 'exit'
        break
      else
        print_error_message('Please pick from the menu above.')
      end
    end
  end
end
