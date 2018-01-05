require_relative '../test_helper.rb'
require_relative '../lib/characters/player_characters/test_player_character.rb'
require 'byebug'

# Testing create character for player character.
class CreateCharacterTest < MiniTest::Test
  def setup
    @character = TestPlayerCharacter.new('Test')
  end

  def test_attributes_are_updated_in_create_character
    with_stdin do |user|
      user.puts 'attributes'
      user.puts 'str'
      user.puts '10'
      user.puts 'back'
      user.puts 'done'
      capture_stdout { @character.create_character }
      assert_equal(18, @character.str, "When adding 10 to character's strength in create " \
                   'character, the strength should result in 10')
    end
  end

  def test_proficiencies_are_updated_in_create_character
    with_stdin do |user|
      user.puts 'proficiencies'
      user.puts 'magic'
      user.puts '1'
      user.puts 'back'
      user.puts 'done'
      capture_stdout { @character.create_character }
      assert_equal(1, @character.magic_prof, "When adding 1 to character's magic proficiency " \
                   'in create character, the proficiency should result in 1')
    end
  end
end
