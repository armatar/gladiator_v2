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
    set_base_attributes
  end

  def set_base_attributes
    @ac = 0
    @bab = 0
    @hp = 0
    @max_hp = 0
    @str = 0
    @dex = 0
    @con = 0
    @mag = 0
    @cha = 0
    @str_modifier = 0
    @dex_modifier = 0
    @con_modifier = 0
    @mag_modifier = 0
    @cha_modifier = 0
    @attack = 0
    @damage = 0
    @one_hand_atk = 0
    @dual_wield_atk = 0
    @two_hand_atk = 0
    @unarmed_atk = 0
    @staff_atk = 0
    @one_hand_damage = 0
    @dual_wield_damage = 0
    @two_hand_damage = 0
    @unarmed_damage = 0
    @staff_damage = 0
    @one_hand_prof = 0
    @dual_wield_prof = 0
    @two_hand_prof = 0
    @unarmed_prof = 0
    @magic_prof = 0
  end
end