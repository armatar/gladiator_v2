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
    print_line
    puts Paint['Str: '.ljust(15), :bold] + @str.to_s.ljust(15) + format('%+d', @str_modifier).to_s
    puts Paint['Dex: '.ljust(15), :bold] + @dex.to_s.ljust(15) + format('%+d', @dex_modifier).to_s
    puts Paint['Con: '.ljust(15), :bold] + @con.to_s.ljust(15) + format('%+d', @con_modifier).to_s
    puts Paint['Mag: '.ljust(15), :bold] + @mag.to_s.ljust(15) + format('%+d', @mag_modifier).to_s
    puts Paint['Cha: '.ljust(15), :bold] + @cha.to_s.ljust(15) + format('%+d', @cha_modifier).to_s
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
    if inventory == {}
      puts 'Inventory is empty.'
    else
      inventory.each_pair do |name, item|
        print name.ljust(15) + 'Type: '.ljust(5) + item[:type]
        new_line
      end
    end
    print_line
  end

  def display_known_spells(spells)
    puts "#{@name}'s Known Spells"
    print_line
    if spells == {}
      puts 'No spells known.'
    else
      spells.each_pair do |name, spell|
        print name.ljust(15) + spell[:description]
        new_line
      end
    end
    print_line
  end
end
