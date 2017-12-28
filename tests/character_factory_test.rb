require_relative '../test_helper.rb'
require_relative '../lib/characters/test_character.rb'
require_relative '../lib/factories/random_character_factory.rb'
require 'byebug'

# Testing the random character factory
class CharacterFactoryTest < MiniTest::Test
  CHARACTER = TestCharacter.new('Test')

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

  new_character = RandomCharacterFactory.randomize(CHARACTER, 1)

  attribute_value = [CHARACTER.str, CHARACTER.dex, CHARACTER.con, CHARACTER.mag,
                       CHARACTER.cha].reduce(:+)
  prof_value = [CHARACTER.one_hand_prof, CHARACTER.two_hand_prof, CHARACTER.dual_wield_prof,
                  CHARACTER.unarmed_prof, CHARACTER.magic_prof].reduce(:+)

  new_att_value = [new_character.str, new_character.dex, new_character.con, new_character.mag,
                new_character.cha].reduce(:+)
  new_prof_value = [new_character.one_hand_prof, new_character.two_hand_prof, new_character.dual_wield_prof,
           new_character.unarmed_prof, new_character.magic_prof].reduce(:+)

  stats_should_change = { 'attributes' =>  [attribute_value, new_att_value],
                          'proficiencies' => [prof_value, new_prof_value] }

  stats_should_change.each do |stat, value|
    define_method("test_that_#{stat}_total_increases_with_randomize") do
      assert_operator(value[0], :<, value[1])
    end
  end
end
