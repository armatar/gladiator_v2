# a module specifically for game-specific ui.
module GameUI
  def start_menu
    clear_screen
    print_line
    puts ''.ljust(15) + Paint['G L A D I A T O R', :underline, :bold]
    print_line
    puts Paint['>', :bold] + ' n e w  g a m e'
    puts Paint['>', :bold] + ' l o a d  g a m e'
    puts Paint['>', :bold] + ' e x i t'
  end

  def goodbye_screen
    new_line
    puts Paint['Thanks for playing Gladiator!', :bold]
    new_line
  end
end
