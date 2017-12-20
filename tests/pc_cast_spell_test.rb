require_relative '../test_helper.rb'
require_relative '../lib/characters/player_characters/test_player_character.rb'
require_relative '../lib/combat.rb'
require 'byebug'

# Testing casting spells in combat for player characters
class PCCastSpellTest < MiniTest::Test
    character = TestPlayerCharacter.new('Test')
    spell = Spells.damage_spells['magic missle']
    character.known_spells['magic missle'] = spell

  should_not_be_nil = { 'target' => :target, 'damage' => :damage,
                        'attack type' => :attack_type, 'spell dc' => :spell_dc }

  should_not_be_nil.each do |name, attribute|
    define_method("test_that_#{name}_is_not_nil") do
      with_stdin do |user|
        user.puts '2'
        user.puts 'magic missle'
        user.puts 'test'
        capture_stdout { @attack_object = character.create_attack_object([character]) }
      end
      refute_nil(@attack_object[attribute])
    end
  end
end
