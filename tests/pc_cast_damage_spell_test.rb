require_relative 'test_helper.rb'
require_relative '../lib/characters/player_characters/test_player_character.rb'
require_relative '../lib/spells.rb'
require 'byebug'

# Testing casting spells in combat for player characters
class PCCastDamageSpellTest < MiniTest::Test
  CHARACTER = TestPlayerCharacter.new('Test')
  CHARACTER.known_spells = Spells.damage_spells

  dmg_should_not_be_nil = { 'target' => :target, 'damage' => :damage,
                            'attack type' => :attack_type, 'spell dc' => :spell_dc }

  dmg_should_not_be_nil.each do |name, attribute|
    define_method("test_that_#{name}_is_not_nil_with_single_target") do
      with_stdin do |user|
        user.puts '2'
        user.puts 'magic missle'
        user.puts 'test'
        capture_stdout { @attack_object = CHARACTER.create_attack_object([CHARACTER]) }
      end
      refute_nil(@attack_object[attribute])
    end
  end

  dmg_should_not_be_nil.each do |name, attribute|
    define_method("test_that_#{name}_is_not_nil_with_target_all") do
      with_stdin do |user|
        user.puts '2'
        user.puts 'burning hands'
        user.puts 'test'
        capture_stdout { @attack_object = CHARACTER.create_attack_object([CHARACTER]) }
      end
      refute_nil(@attack_object[attribute])
    end
  end
end
