require_relative '../character.rb'

# Child class of character used specifically for testing.
class TestCharacter < Character
  attr_accessor :max_mana, :max_hp

  def initialize(name)
    super(name)
  end
end
