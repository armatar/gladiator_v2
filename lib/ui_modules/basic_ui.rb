module BasicUI
  def print_line
    puts "-" * 50
  end

  def clear_screen
    system "clear"
  end

  def new_line
    puts "\n"
  end

  def ask_question(question, tip=nil, options=nil)
    puts question
    print_line
    if tip
      puts "Tip! " + tip
    end
    if options
      print "Options: ".ljust(5)
      options.each do |option|
        print "[" + option + "]".ljust(5)
      end
    end
    new_line
    print_line
    print "> "
    answer = gets.chomp
    return answer.downcase
  end

  def print_error_message(message)
    puts Paint[message, :red]
  end

  def pause
    puts "Press [enter] to continue..."
    gets.chomp
  end
end