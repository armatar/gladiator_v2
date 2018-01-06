require 'byebug'
require_relative '../test_helper.rb'
require_relative '../lib/items.rb'
require_relative '../lib/characters/player_characters/test_player_character.rb'

# A test for player character item use.
class PCUseItemTest < MiniTest::Test
  def test_that_attack_object_is_created_when_using_item
    pc = TestPlayerCharacter.new('Test')
    pc.inventory['antiseptic'] = Items.consumables['antiseptic']
    pc.max_hp = 100
    pc.hp = 1
    with_stdin do |user|
      user.puts '4'
      user.puts 'antiseptic'
      capture_stdout { refute_nil(pc.create_attack_object(pc)[:message]) }
    end
  end

  pc = TestPlayerCharacter.new('Test')
  ally = TestPlayerCharacter.new('Ally')
  pc.join_party(ally.party)
  pc.inventory = Items.healing_items

  pc.inventory.find_all { |x| x[1][:target] == 'any' }.to_h.each_pair do |name, item|
    define_method("test_use_healing_item_#{name}_with_target_any") do
      with_stdin do |user|
        user.puts name
        user.puts 'Test'
        pc.max_hp = 100
        pc.hp = 0
        pc.max_mana = 100
        pc.mana = 0
        result = pc.get_item_heal_bonus(item[:bonus])
        capture_stdout { pc.choose_item_to_use }
        assert_equal(result, pc.send(item[:stat]))
      end
    end
  end

  pc.inventory.find_all { |x| x[1][:target] == 'ally' }.to_h.each_pair do |name, item|
    define_method("test_use_healing_item_#{name}_on_ally") do
      with_stdin do |user|
        user.puts name
        user.puts 'Ally'
        ally.max_hp = 100
        ally.hp = 0
        result = ally.get_item_heal_bonus(item[:bonus])
        capture_stdout { pc.choose_item_to_use }
        assert_equal(result, ally.hp)
      end
    end
  end

  pc.inventory.find_all { |x| x[1][:target] == 'self' }.to_h.each_pair do |name, item|
    define_method("test_use_healing_item_#{name}_with_target_self") do
      with_stdin do |user|
        user.puts name
        pc.max_hp = 100
        pc.hp = 0
        result = pc.get_item_heal_bonus(item[:bonus])
        capture_stdout { pc.choose_item_to_use }
        assert_equal(result, pc.hp)
      end
    end
  end
end
