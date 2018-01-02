require_relative '../test_helper.rb'
require_relative '../lib/factories/random_character_factory.rb'
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
end
