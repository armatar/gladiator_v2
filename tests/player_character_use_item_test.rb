require 'byebug'
require_relative '../test_helper.rb'
require_relative '../lib/characters/player_characters/test_player_character.rb'

# A test for player character item use.
class PlayerCharacterUseItemTest < MiniTest::Test
  pc = TestPlayerCharacter.new('Test')
  healing_item1 = { name: 'small_health_potion', type: 'healing', stat: 'hp',
                    bonus: 1, target: 'any', price: 10 }
  healing_item2 = { name: 'large_health_potion', type: 'healing', stat: 'hp',
                    bonus: 10, target: 'any', price: 10 }
  pc.inventory['small health potion'] = healing_item1
  pc.inventory['large health potion'] = healing_item2

  pc.inventory.each_pair do |name, item|
    define_method("test_use_healing_item_#{name}") do
      with_stdin do |user|
        user.puts name
        user.puts 'Test'
        pc.max_hp = 100
        pc.hp = 1
        result = 1 + item[:bonus]
        capture_stdout { pc.get_item_to_use }
        assert_equal(result, pc.hp)
      end
    end
  end
end
