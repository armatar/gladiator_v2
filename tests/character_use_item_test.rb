require_relative '../test_helper.rb'
require_relative '../lib/characters/test_character.rb'

class CharacterUseItemTest < MiniTest::Test
  char = TestCharacter.new("Test")
  char.max_mana = 100
  char.max_hp = 100

  hp_items = {2 => { name: "small_health_potion", type: "healing", stat: "hp", bonus: 1, target: "self", price: 10},
              5 => { name: "large_health_potion", type: "healing", stat: "hp", bonus: 4, target: "self", price: 10}}

  mana_items = {2 => { name: "small_mana_potion", type: "healing", stat: "mana", bonus: 1, target: "self", price: 10},
                5 => { name: "large_mana_potion", type: "healing", stat: "mana", bonus: 4, target: "self", price: 10}}

  hp_items.each_pair do | key, item |
    define_method("test_#{item[:name]}_heals_#{item[:type]}_by_#{item[:bonus]}_with_target_self") do 
      char.hp = 1
      char.use_item(item)
      assert_equal(key, char.hp)
    end
  end

  mana_items.each_pair do | key, item |
    define_method("test_#{item[:name]}_heals_#{item[:type]}_by_#{item[:bonus]}_with_target_self") do 
      char.mana = 1
      char.use_item(item)
      assert_equal(key, char.mana)
    end
  end
end