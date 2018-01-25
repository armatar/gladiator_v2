require_relative 'combat_modules.rb'
require_relative 'ui_modules.rb'

# Combat class is the mediator between combatants.
# You send in whomever you want to fight in an instance
# of combat and combat ensures that everyone gets a turn
# and that the fighting continues until that is complete.
class Combat
  include CombatModules
  include UIModules

  attr_reader :battle_log

  def initialize(allies, enemies)
    @battle_log = []
    @allies = allies
    @enemies = enemies
    @order_of_play = get_order_of_play(@allies, @enemies)
  end

  def fight
    continue_combat = true
    continue_combat = auto_attack_round while continue_combat
    clear_screen
    display_battle_log(@battle_log)
    pause
    @victory
  end

  def auto_attack_round
    @order_of_play.each do |character|
      return false if combat_over?
      implement_auto_attack(character) unless character.dead
    end
    true
  end

  private

  def implement_auto_attack(character)
    if @allies.include?(character)
      if character.controlled
        display_combat_screen
        @battle_log = []
      end
      auto_attack_round_helper(character, @enemies)
    else
      auto_attack_round_helper(character, @allies)
    end
  end

  def auto_attack_round_helper(character, target_array)
    attack_object = character.create_attack_object(target_array)
    @battle_log.push(attack_object[:message])
    return unless attack_object[:target]
    defense_object = coordinate_defence(attack_object, target_array)
    @battle_log.push(defense_object[:message])
  end

  def coordinate_defence(attack_object, target_array)
    message = []
    defense_object = {}
    if attack_object[:target] == 'all'
      target_array.each do |target|
        defense_object.merge!(target.decode_attack_object(attack_object))
        message.push(defense_object[:message])
      end
      defense_object[:message] = message
      return defense_object
    else
      return target_array[attack_object[:target]].decode_attack_object(attack_object)
    end
  end

  def get_order_of_play(allies, enemies)
    order_of_play = []
    allies.each do |ally|
      order_of_play.push(ally)
    end
    enemies.each do |enemy|
      order_of_play.push(enemy)
    end
    order_of_play.sort_by!(&:init)
    order_of_play.reverse!
  end

  def combat_over?
    all_allies_dead = true
    all_enemies_dead = true
    @allies.each do |ally|
      all_allies_dead = false unless ally.dead
    end
    @enemies.each do |enemy|
      all_enemies_dead = false unless enemy.dead
    end
    combat_response(all_allies_dead, all_enemies_dead)
  end

  def combat_response(all_allies_dead, all_enemies_dead)
    if all_allies_dead
      @battle_log.push('All allies have died! Enemies win!')
      @victory = false
      true
    elsif all_enemies_dead
      @battle_log.push('All enemies have died! Allies win!')
      @victory = true
      true
    else
      false
    end
  end
end
