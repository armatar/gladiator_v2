# This module is specifically to add basic
# UI functionality to the program that
# any other UI would universially need.
module BasicUI
  def print_line
    puts '-' * 50
  end

  def clear_screen
    system 'clear'
  end

  def new_line
    puts "\n"
  end

  def ask_question(question, tip = nil, options = nil)
    print_line
    puts Paint["Q: #{question}", :bold]
    if tip || options
      print_line
    end
    puts Paint['Tip! ', :italic] + tip if tip
    if options
      print Paint['Options: '.ljust(5), :italic]
      options.each do |option|
        print '[ ' + option + ' ]'.ljust(5)
      end
      new_line
    end
    prompt_answer
  end

  def prompt_answer
    print_line
    print '> '
    gets.chomp.downcase
  end

  def print_error_message(message)
    puts Paint[message, :red]
  end

  def pause
    puts 'Press [enter] to continue...'
    gets.chomp
  end
end
