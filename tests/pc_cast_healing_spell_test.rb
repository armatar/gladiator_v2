require_relative 'test_helper.rb'
require_relative '../lib/characters/player_characters/test_player_character.rb'
require_relative '../lib/spells.rb'
require 'byebug'

# Testing casting spells in combat for player characters
class PCCastHealingSpellTest < MiniTest::Test
  def setup
    @character = TestPlayerCharacter.new('Test')
    @ally = TestPlayerCharacter.new('Ally')
    @character.join_party(@ally.party)
    @character.known_spells = Spells.healing_spells
  end

  def test_message_is_not_nil_with_heal_any
    attack_object = nil
    with_stdin do |user|
      @character.hp = 1
      user.puts '2'
      user.puts 'cure light wounds'
      user.puts 'Test'
      user.puts 'cure light wounds'
      user.puts 'Test'
      capture_stdout { attack_object = @character.create_attack_object([@character]) }
    end
    refute_nil(attack_object[:message])
  end

  def test_character_is_healed_with_spell_target_self
    @character.hp = 1
    @character.max_hp = 100
    @character.cast_healing_spell(@character.known_spells['inner light'], @character.party)
    assert_operator(1, :<, @character.hp)
  end

  def test_character_is_healed_with_spell_target_ally
    with_stdin do |user|
      @ally.hp = 1
      @ally.max_hp = 100
      user.puts @ally.name
      capture_stdout { @character.cast_healing_spell(@character.known_spells['healing hands'],
                       @character.party) }
      assert_operator(1, :<, @ally.hp)
    end
  end

  def test_character_is_healed_with_spell_target_all
    @character.hp = 1
    @character.max_hp = 100
    @ally.hp = 1
    @ally.max_hp = 100
    @character.cast_healing_spell(@character.known_spells['burst of light'], @character.party)
    assert_operator(1, :<, @character.hp)
    assert_operator(1, :<, @ally.hp)
  end
end
