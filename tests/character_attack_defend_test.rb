require 'byebug'
require_relative '../test_helper.rb'
require_relative '../lib/characters/test_character.rb'

# A test for player character item use.
class CharacterAttackDefendTest < MiniTest::Test
  @character = TestCharacter.new('Test')

  aa_atk_obj = { 'atk roll' => @character.create_attack_object([@character])[:attack],
                 'damage' => @character.create_attack_object([@character])[:damage],
                 'target' => @character.create_attack_object([@character])[:target],
                 'message' => @character.create_attack_object([@character])[:message] }

  aa_atk_obj.each_pair do |name, attribute|
    define_method("test_#{name}_auto_attack_attack_object") do
      refute_nil(attribute)
    end
  end
  auto_attack = { attack: [1], damage: [1], attack_type: 'auto attack' }
  aa_defence_obj = { 'message' => @character.decode_attack_object(auto_attack)[:message] }

  aa_defence_obj.each_pair do |name, attribute|
    define_method("test_#{name}_auto_attack_defence_object") do
      refute_nil(attribute)
    end
  end

  def test_character_take_damage
    character = TestCharacter.new('Test')
    character.hp = 10
    character.take_damage(5)
    assert_equal(5, character.hp)
    refute(character.dead)
  end

  def test_character_die
    character = TestCharacter.new('Test')
    character.hp = 10
    character.take_damage(11)
    assert_equal(0, character.hp)
    assert(character.dead)
  end
end
