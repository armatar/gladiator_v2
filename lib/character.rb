class Character
  attr_reader :name, :level, :ac, :bab, :hp, :max_hp
  attr_reader :str, :dex, :con, :mag, :cha
  attr_reader :str_modifier, :dex_modifier, :con_modifier, :mag_modifier, :cha_modifier
  attr_reader :attack, :one_hand_atk, :dual_wield_atk, :two_hand_atk, :unarmed_atk, :staff_atk
  attr_reader :damage, :one_hand_damage, :dual_wield_damage, :unarmed_damage, :two_hand_damage, :staff_damage
  attr_reader :one_hand_prof, :two_hand_prof, :dual_wield_prof, :unarmed_prof, :magic_prof

  def initialize(name)
    @name = name
    create_character_base
  end

  def create_character_base
    @level = 1
  end
end