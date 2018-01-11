require_relative 'test_helper.rb'
require_relative '../lib/characters/test_character.rb'
require 'byebug'

# Testing casting spells in combat
class CastHealSpellTest < MiniTest::Test
  character = TestCharacter.new('Test')
  ally = TestCharacter.new('Ally')
  spell1 = Spells.healing_spells['cure light wounds']
  spell2 = Spells.healing_spells['inner light']
  spell3 = Spells.healing_spells['healing hands']
  spell4 = Spells.healing_spells['burst of light']

  heal_should_not_be_nil = { 'message' => :message }

  heal_should_not_be_nil.each do |name, attribute|
    define_method("test_that_#{name}_is_not_nil_with_healing_any") do
      attack_object = character.cast_spell(spell1, [character], [character, ally])
      refute_nil(attack_object[attribute])
    end
  end

  heal_should_not_be_nil.each do |name, attribute|
    define_method("test_that_#{name}_is_not_nil_with_healing_self") do
      attack_object = character.cast_spell(spell2, [character], [character, ally])
      refute_nil(attack_object[attribute])
    end
  end

  heal_should_not_be_nil.each do |name, attribute|
    define_method("test_that_#{name}_is_not_nil_with_healing_ally") do
      attack_object = character.cast_spell(spell3, [character], [character, ally])
      refute_nil(attack_object[attribute])
    end
  end

  heal_should_not_be_nil.each do |name, attribute|
    define_method("test_that_#{name}_is_not_nil_with_healing_all") do
      attack_object = character.cast_spell(spell4, [character], [character, ally])
      refute_nil(attack_object[attribute])
    end
  end
  character2 = TestCharacter.new('Test')

  attributes = ['mana', 'hp']
  attributes.each do |att|
    define_method("test_#{att}_returns_fully_healed") do
      character2.send("#{att}=", 100)
      character2.send("max_#{att}=", 100)
      assert(character2.check_if_fully_healed(att))
    end
  end

  character3 = TestCharacter.new('Test')

  attributes.each do |att|
    define_method("test_#{att}_returns_not_fully_healed") do
      character3.send("#{att}=", 10)
      character3.send("max_#{att}=", 100)
      refute(character3.check_if_fully_healed(att))
    end
  end
end
