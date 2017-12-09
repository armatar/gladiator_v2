require_relative 'combat_modules.rb'
require_relative 'ui_modules.rb'

class Combat
  include CombatModules
  include UIModules

  def initialize(allies, enemies)
    @battle_log = []
    @allies = allies
    @enemies = enemies
    @order_of_play = get_order_of_play(@allies, @enemies)
  end

  def auto_combat
    continue_combat = true

    while continue_combat
      display_combat_screen
      continue_combat = auto_attack_round
    end
    display_battle_log(@battle_log)
  end

  def auto_attack_round
    @battle_log = []
    @order_of_play.each do | character |
      if !character.dead
        if @allies.include?(character)
          index = get_target_to_attack(@enemies)
          defense_object = @enemies[index].defend(character.auto_attack)
          @battle_log.push(defense_object[:message])
        else
          index = get_target_to_attack(@allies)
          defense_object = @allies[index].defend(character.auto_attack)
          @battle_log.push(defense_object[:message])
        end
      end
      if combat_over?
        return false
      end
    end
    return true
  end

  private
    def get_order_of_play(allies, enemies)
      order_of_play = []
      allies.each do |ally|
        order_of_play.push(ally)
      end
      enemies.each do |enemy|
        order_of_play.push(enemy)
      end
      order_of_play.sort_by! do | character |
        character.init
      end
      order_of_play.reverse!
      return order_of_play
    end

    def combat_over?
      all_allies_dead = true
      all_enemies_dead = true
      @allies.each do |ally|
        if !ally.dead
          all_allies_dead = false
        end
      end
      @enemies.each do |enemy|
        if !enemy.dead
          all_enemies_dead = false
        end
      end
      if all_allies_dead
        @battle_log.push("All allies have died! Enemies win!")
        return true
      elsif all_enemies_dead
        @battle_log.push("All enemies have died! Allies win!")
        return true
      else
        return false
      end
    end

    def get_target_to_attack(array)
      invalid = true
      index = nil
      while invalid
        index = rand(0..(array.length-1))
        if !array[index].dead
          invalid = false
        end
      end
      return index
    end
end