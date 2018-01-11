require 'byebug'
require_relative 'test_helper.rb'
require_relative '../lib/characters/player_characters/test_player_character.rb'

# A test for player character item use.
class PCAutoAttackTest < MiniTest::Test
  pc = TestPlayerCharacter.new('Test')

  atk_obj = { 'atk roll' => :attack, 'damage' => :damage, 'target' => :target,
              'message' => :message }

  atk_obj.each_pair do |name, attribute|
    define_method("test_#{name}_exists_in_attack_object") do
      with_stdin do |user|
        user.puts '1'
        user.puts 'test'
        capture_stdout { @attack_object = pc.create_attack_object([pc]) }
      end
      refute_nil(@attack_object[attribute])
    end
  end
end
