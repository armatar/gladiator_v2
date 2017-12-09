module CombatUI
  def show_combatants
    puts "Players: "
    @allies.each do | ally |
      puts ally.name
    end

    puts "Enemies: "
    @enemies.each do | enemy |
      puts enemy.name
    end
  end

  def display_stats(array)
    array.each_index do | index |
      print array[index].name.ljust(16)
    end
    new_line
    array.each_index do | index |
      print "HP: " + array[index].hp.to_s + "/" + array[index].max_hp.to_s.ljust(10)
    end
    new_line
    array.each_index do | index |
      print "Mana: " + array[index].mana.to_s + "/" + array[index].max_mana.to_s.ljust(8)
    end
    new_line
  end

  def display_battle_icon(array)
    print_line
    new_line
    array.each do |character|
      if character.hp > 0
        print "o".ljust(16)
      else
        print "x".ljust(16)
      end
    end
    new_line
    print_line
  end

  def display_battle_log(log)
    print_line
    puts Paint["Battle Log:", :bold]
    if log
      log.each do |line|
        puts line
      end
    end
    print_line
  end

  def display_combat_screen
    clear_screen
    display_battle_log(@battle_log)
    display_stats(@enemies)
    display_battle_icon(@enemies)
    display_battle_icon(@allies)
    display_stats(@allies)
    print_line
  end
end