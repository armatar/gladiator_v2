require_relative 'ui_modules/game_ui.rb'
require_relative 'ui_modules/basic_ui.rb'
require_relative 'characters/player_character.rb'
require_relative 'factories/random_character_factory.rb'

# Class to actually start the game from a player perspective.
class Game
  include GameUI
  include BasicUI

  def start
    error_message = nil
    loop do
      start_menu
      print_error_message(error_message) if error_message
      error_message = nil
      case ask_question('What would you like to do?')
      when 'new game', 'new'
        new_game
      when 'load game', 'load'
        error_message = 'Not currently an availble option'
      when 'exit'
        goodbye_screen
        break
      else
        error_message = 'Please pick from the menu above.'
      end
    end
  end

  def new_game
    name = ask_question('Please select a name for your character.')
    @character = PlayerCharacter.new(name.upcase)
    @character.create_character
    play
  end

  def play
    error_message = nil
    loop do
      main_menu
      print_error_message(error_message) if error_message
      error_message = nil
      case ask_question('What would you like to do?')
      when 'fight'
        combat = Combat.new(@character.party,
                            RandomCharacterFactory.randomize(1, 'Enemy 1', false).party)
        result = combat.fight
        puts "result: #{result.inspect}"
      when 'shop'
        error_message = 'Not currently an availble option'
      when 'exit'
        break
      else
        error_message = 'Please pick from the menu above.'
      end
    end
  end
end
