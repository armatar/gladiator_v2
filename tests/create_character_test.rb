require_relative '../test_helper.rb'
require_relative '../lib/characters/player_characters/test_player_character.rb'
require 'byebug'

# Testing create character for player character.
class CreateCharacterTest < MiniTest::Test
  character = TestPlayerCharacter.new('Test')

  atts_to_update = ['str', 'dex', 'con', 'mag', 'cha']

  atts_to_update.each do |att|
    define_method("test_attribute_#{att}_is_updated_in_create_character") do
      with_stdin do |user|
        user.puts 'attributes'
        user.puts att
        user.puts '1'
        user.puts 'back'
        user.puts 'done'
        capture_stdout { character.create_character }
        assert_equal(9, character.send(att), "When adding 1 to character's #{att} in create " \
                     'character, the strength should result in 9')
      end
    end
  end

  character2 = TestPlayerCharacter.new('Test')

  profs_to_update = { 'one handed' => 'one_hand_prof', 'dual wield' => 'dual_wield_prof',
                      'two handed' => 'two_hand_prof', 'unarmed' => 'unarmed_prof',
                      'magic' => 'magic_prof' }
  profs_to_update.each do |call, prof|
    define_method("test_prof_#{prof}_is_updated_in_create_character") do
      with_stdin do |user|
        user.puts 'proficiencies'
        user.puts call
        user.puts '1'
        user.puts 'back'
        user.puts 'done'
        capture_stdout { character2.create_character }
        assert_equal(1, character2.send(prof), "When adding 1 to character's #{prof} proficiency " \
                     'in create character, the proficiency should result in 1')
      end
    end
  end
end
