require_relative 'ui_modules/game_ui.rb'
require_relative 'ui_modules/basic_ui.rb'

class Game
  include GameUI
  include BasicUI

  def start
    start_menu
    loop do
      case ask_question('What would you like to do?')
      when 'new game'
      when 'load game'
      when 'exit'
        goodbye_screen
        break
      end
    end
  end
end