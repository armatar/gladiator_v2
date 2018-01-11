require_relative 'test_helper.rb'
require_relative '../lib/factories/random_character_factory.rb'
require_relative '../lib/characters/test_character.rb'
require 'byebug'

# Testing the random character factory
class CharacterFactoryTest < MiniTest::Test
  stats_to_test = { ['magic', 'magic'] => [:str_max, :dex_max],
                    ['1-hand weapon', '1-hand weapon'] => [:mag_max, :cha_max],
                    ['1-hand weapon', 'magic'] => [] }

  stats_to_test.each do |pair, altered|
    define_method("test_max_hash_for_#{pair[0]}_#{pair[1]}") do
      max_hash = RandomCharacterFactory.get_stat_max(pair[0], pair[1])
      max_hash.each do |key, value|
        if altered.include?(key)
          refute_equal(99, value, "#{key} should not be 99 with prim/secnd stats as #{pair}.")
        else
          assert_equal(99, value, "#{key} should be 99 with prim/secnd stats as #{pair}.")
        end
      end
    end
  end

  static_hash = RandomCharacterFactory.get_stat_max('magic', 'magic')
  stats_to_test = { 20 => 60, 10 => 50, 15 => 55, 30 => 70, 40 => 80 }

  stats_to_test.each do |points_to_assign, total|
    define_method("test_#{points_to_assign}_returns_#{total}_attribute_points") do
      att_hash = RandomCharacterFactory.randomize_attributes(points_to_assign, static_hash)
      assert_equal(total, att_hash.values.reduce(:+))
    end
  end

  character = TestCharacter.new('Test')
  character = RandomCharacterFactory.give_inventory('1-hand', character)
  weapon_subtypes = ['1-hand', '2-hand', 'dual wield', 'unarmed', 'staff']

  weapon_subtypes.each do |type|
    define_method("test_that_equipped_weapon_is_of_subtype_#{type}") do
      RandomCharacterFactory.give_inventory(type, character)
      assert_equal(type, character.equipped_weapon[:subtype])
    end
  end

  def test_when_one_hand_skill_inventory_has_shield
    character2 = TestCharacter.new('Test')
    RandomCharacterFactory.give_inventory('1-hand', character2)
    assert(character2.inventory.values.find { |x| x[:type] == 'shield' })
  end

  spells_should_have = { [1, 1] => 4, [0, 1] => 2, [0, 0] => 0 }
  character3 = TestCharacter.new('Test')

  spells_should_have.each do |values, num_spells|
    define_method("test_character_has_#{num_spells}_when_mag_mod_and_cha_mod_are_#{values}") do
      character3.known_spells = {}
      character3.mag_modifier = values[0]
      character3.cha_modifier = values[1]
      assert_equal(num_spells, RandomCharacterFactory.give_spells(character3).known_spells.length)
    end
  end

  def test_random_characater_is_player_character_when_controlled
    character = RandomCharacterFactory.randomize(1, 'Test', true)
    assert(character.instance_of?(PlayerCharacter))
  end

  def test_random_characater_is_character_when_not_controlled
    character = RandomCharacterFactory.randomize(1, 'Test', false)
    assert(character.instance_of?(Character))
  end
end
