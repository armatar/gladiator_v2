# Creates UI and display for characters.
module CharacterUI
  def print_character_sheet
    clear_screen
    print_line
    puts Paint['Name: '.ljust(15), :bold] + @name.to_s
    puts Paint['Level: '.ljust(15), :bold] + @level.to_s
    print_party_names(party)
    print_line
    puts Paint['HP: '.ljust(15), :bold] + @max_hp.to_s
    puts Paint['Mana: '.ljust(15), :bold] + @max_mana.to_s
    puts Paint['AC: '.ljust(15), :bold] + @ac.to_s
    print_line
    puts Paint['BAB: '.ljust(15), :bold] + format('%+d', @bab).to_s
    puts Paint['Init: '.ljust(15), :bold] + format('%+d', @init).to_s
    print_line
    display_attributes
    display_profs
    puts Paint['Equipped Weapon: '.ljust(15), :bold] + @equipped_weapon[:name].to_s.ljust(15)
    puts Paint['Equipped Weapon: '.ljust(15), :bold] +
         @equipped_shield[:name].to_s.ljust(15) if @equipped_shield
    print_line
    display_inventory(@inventory)
    display_known_spells(@known_spells)
  end

  def display_attributes
    puts Paint['Str: '.ljust(15), :bold] + @str.to_s.ljust(15) + format('%+d', @str_modifier).to_s
    puts Paint['Dex: '.ljust(15), :bold] + @dex.to_s.ljust(15) + format('%+d', @dex_modifier).to_s
    puts Paint['Con: '.ljust(15), :bold] + @con.to_s.ljust(15) + format('%+d', @con_modifier).to_s
    puts Paint['Mag: '.ljust(15), :bold] + @mag.to_s.ljust(15) + format('%+d', @mag_modifier).to_s
    puts Paint['Cha: '.ljust(15), :bold] + @cha.to_s.ljust(15) + format('%+d', @cha_modifier).to_s
    print_line
  end

  def display_profs
    print Paint['One Handed: '.ljust(15), :bold]
    prof_line(@one_hand_prof)
    print Paint['Dual Wield: '.ljust(15), :bold]
    prof_line(@dual_wield_prof)
    print Paint['Two Handed: '.ljust(15), :bold]
    prof_line(@two_hand_prof)
    print Paint['Unarmed: '.ljust(15), :bold]
    prof_line(@unarmed_prof)
    print Paint['Magic: '.ljust(15), :bold]
    prof_line(@magic_prof)
    print_line
  end

  def prof_line(number)
    print 'x ' * number
    print '_ ' * (10-number)
    new_line
  end

  def print_party_names(party)
    print Paint['Current Party: '.ljust(15), :bold]
    party.each do |member|
      print member.name.ljust(10)
    end
    new_line
  end

  def display_inventory(inventory)
    puts Paint["#{@name}'s Inventory", :bold]
    print_line
    if inventory == {}
      puts Paint['Inventory is empty.', :red]
    else
      equipment = {}
      consumables = {}
      inventory.each_pair do |name, item|
        case item[:type]
        when 'weapon', 'armor', 'shield'
          equipment[name] = item
        else
          consumables[name] = item
        end
      end
      display_specific_inventory(equipment, 'e q u i p m e n t ')
      display_specific_inventory(consumables, 'c o n s u m a b l e s ')
    end
    print_line
  end

  def display_specific_inventory(inventory, label)
    puts Paint["#{label}: "]
    new_line
    count = 1
    inventory.each_pair do |name, item|
      puts "#{count}. " + Paint["#{name}:".ljust(22), :italic] + "\n" + 
           item[:description]
      count += 1
    end
    new_line
  end

  def display_known_spells(spells)
    puts Paint["#{@name}'s Known Spells", :bold]
    print_line
    if spells == {}
      puts Paint['No spells known.', :red]
    else
      count = 1
      spells.each_pair do |name, spell|
        print "#{count}. " + Paint["#{name}:".ljust(22), :italic] + "\n" + spell[:description]
        count += 1
        new_line
        new_line
      end
    end
    print_line
  end
end
