require 'byebug'
require_relative '../test_helper.rb'
require_relative '../lib/items.rb'
require_relative '../lib/characters/player_characters/test_player_character.rb'

# A test for player character item use.
class PCUseItemTest < MiniTest::Test
  pc = TestPlayerCharacter.new('Test')
  ally = TestPlayerCharacter.new('Ally')
  pc.join_party(ally.party)
  pc.inventory['small_health_potion'] = Items.consumables['small health potion']
  pc.inventory['large_health_potion'] = Items.consumables['large health potion']
  pc.inventory['revive'] = Items.consumables['revive']

  pc.inventory.find_all {|x| x[1][:target] == 'any' }.to_h.each_pair do |name, item|
    define_method("test_use_healing_item_#{name}_on_self") do
      with_stdin do |user|
        user.puts name
        user.puts 'Test'
        pc.max_hp = 100
        pc.hp = 1
        result = 1 + item[:bonus]
        capture_stdout { pc.choose_item_to_use }
        assert_equal(result, pc.hp)
      end
    end
  end

  pc.inventory.find_all {|x| x[1][:target] == 'ally' }.to_h.each_pair do |name, item|
    define_method("test_use_healing_item_#{name}_on_ally") do
      with_stdin do |user|
        user.puts name
        user.puts 'Ally'
        ally.max_hp = 100
        ally.hp = 1
        result = 1 + ally.get_item_heal_bonus(item[:bonus])
        capture_stdout { pc.choose_item_to_use }
        assert_equal(result, ally.hp)
      end
    end
  end
end
