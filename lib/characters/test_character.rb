require_relative '../character.rb'

# Child class of character used specifically for testing.
class TestCharacter < Character
  attr_accessor :max_mana, :max_hp, :ac, :attack, :damage, :mag_resist, :spell_failure_chance
  attr_accessor :dex, :str, :con, :mag, :cha

  def initialize(name)
    super(name)
  end
end
