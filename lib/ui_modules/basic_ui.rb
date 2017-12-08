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
end