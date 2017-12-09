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
      options.each do |option|
        puts "[" + option + "]"
      end
    end
    print "> "
    answer = gets.chomp
    return answer.downcase
  end

  def print_error_message(message)
    puts Paint[message, :red]
  end
end