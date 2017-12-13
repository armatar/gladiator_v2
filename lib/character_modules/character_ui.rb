module CharacterUI

  def print_character_sheet
    clear_screen
    print_line
    puts Paint["Name: ".ljust(15), :bold] + @name.to_s
    puts Paint["Level: ".ljust(15), :bold] + @level.to_s
    print_line
    puts Paint["HP: ".ljust(15), :bold] + @max_hp.to_s
    puts Paint["Mana: ".ljust(15), :bold] + @max_mana.to_s
    puts Paint["AC: ".ljust(15), :bold] + @ac.to_s
    print_line
    puts Paint["BAB: ".ljust(15), :bold] + sprintf("%+d", @bab).to_s
    puts Paint["Init: ".ljust(15), :bold] + sprintf("%+d", @init).to_s
  end

  def print_party_names(party)
    print "Current Party: "
    party.each do | member| 
      print member.name.ljust(10)
    end
    new_line
  end

  def display_inventory(inventory)
    clear_screen
    puts "#{@name}'s Inventory"
    print_line
    if @inventory == {}
      puts "Inventory is empty."
    else
      inventory.each_pair do | name, item |
        print name.ljust(15) + "Type: ".ljust(5) + item[:type]
        new_line
      end
    end
    print_line
  end
end


=begin
  attr_reader :name, :level, :ac, :bab, :hp, :max_hp, :init, :mana, :max_mana
  attr_reader :mag_resist, :cbm, :cbm_def, :shield_bonus, :armor_bonus, :spell_failure_chance
  attr_reader :str, :dex, :con, :mag, :cha
  attr_reader :equipped_weapon, :equipped_shield
  attr_reader :str_modifier, :dex_modifier, :con_modifier, :mag_modifier, :cha_modifier
  attr_reader :attack, :one_hand_atk, :dual_wield_atk, :two_hand_atk, :unarmed_atk, :staff_atk
  attr_reader :damage, :one_hand_damage, :dual_wield_damage, :unarmed_damage, :two_hand_damage, :staff_damage
  attr_reader :one_hand_prof, :two_hand_prof, :dual_wield_prof, :unarmed_prof, :magic_prof
=end