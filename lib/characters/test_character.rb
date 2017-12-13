require_relative "../character.rb"

class TestCharacter < Character
  attr_accessor :max_mana, :max_hp

  def initialize(name)
    super(name)
  end
end