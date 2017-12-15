# Creates UI and display for characters.
module CharacterUI
  def print_character_sheet
    clear_screen
    print_line
    puts Paint['Name: '.ljust(15), :bold] + @name.to_s
    puts Paint['Level: '.ljust(15), :bold] + @level.to_s
    print_line
    puts Paint['HP: '.ljust(15), :bold] + @max_hp.to_s
    puts Paint['Mana: '.ljust(15), :bold] + @max_mana.to_s
    puts Paint['AC: '.ljust(15), :bold] + @ac.to_s
    print_line
    puts Paint['BAB: '.ljust(15), :bold] + format('%+d', @bab).to_s
    puts Paint['Init: '.ljust(15), :bold] + format('%+d', @init).to_s
  end

  def print_party_names(party)
    print 'Current Party: '
    party.each do |member|
      print member.name.ljust(10)
    end
    new_line
  end

  def display_inventory(inventory)
    puts "#{@name}'s Inventory"
    print_line
    if @inventory == {}
      puts 'Inventory is empty.'
    else
      inventory.each_pair do |name, item|
        print name.ljust(15) + 'Type: '.ljust(5) + item[:type]
        new_line
      end
    end
    print_line
  end
end
