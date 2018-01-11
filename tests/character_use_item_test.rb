require_relative 'test_helper.rb'
require_relative '../lib/characters/test_character.rb'

# This test just tests the character feature to use items
# on itself. This makes sure the item effect actually functions
# correctly.
class CharacterUseItemTest < MiniTest::Test
  char = TestCharacter.new('Test')
  char.max_mana = 100
  char.max_hp = 100

  hp_items = { 2 => { name: 'small_health_potion', type: 'healing', stat: 'hp',
                      bonus: 1, target: 'self', price: 10 },
               5 => { name: 'large_health_potion', type: 'healing', stat: 'hp',
                      bonus: 4, target: 'self', price: 10 } }

  mana_items = { 2 => { name: 'small_mana_potion', type: 'healing',
                        stat: 'mana', bonus: 1, target: 'self', price: 10 },
                 5 => { name: 'large_mana_potion', type: 'healing',
                        stat: 'mana', bonus: 4, target: 'self', price: 10 } }

  hp_items.each_pair do |key, item|
    define_method("test_#{item[:name]}_heals_self_hp_by_#{item[:bonus]}") do
      char.hp = 1
      char.use_item(item)
      assert_equal(key, char.hp)
    end
  end

  mana_items.each_pair do |key, item|
    define_method("test_#{item[:name]}_heals_self_mana_by_#{item[:bonus]}") do
      char.mana = 1
      char.use_item(item)
      assert_equal(key, char.mana)
    end
  end
  char2 = TestCharacter.new('Test')

  atts_to_test = %w[mana hp]

  atts_to_test.each do |att|
    define_method("test_#{att}_doesn't_update_over_max") do
      char2.send("#{att}=", 9)
      char2.send("max_#{att}=", 10)
      char2.heal(att, 10)
      assert_equal(10, char2.send(att))
    end
  end
end
