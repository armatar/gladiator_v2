# A module to manage random character inventory and spells.
module RandomCharacterInventory
  def give_inventory(primary_skill, character)
    weapon_type = primary_skill
    weapon_type = 'staff' if primary_skill == 'magic'
    character.inventory = Items.consumables.to_a.sample(1).to_h
    weapon = Items.weapons.values.find_all { |item| item[:subtype] == weapon_type }.sample
    character = give_equipped_weapon(weapon, character)
    character.inventory[weapon[:name]] = weapon
    if weapon_type == '1-hand'
      shield = Items.armor_and_shields.values.find_all { |item| item[:type] == 'shield' }.sample
      character = give_shield(shield, character)
      character.inventory[shield[:name]] = shield
    end
    give_spells(character)
    character
  end

  def give_equipped_weapon(weapon, character)
    character.equipped_weapon = weapon
    character
  end

  def give_shield(shield, character)
    character.equipped_shield = shield
    character
  end

  def give_spells(character)
    number_of_spells = character.mag_modifier + character.cha_modifier
    number_of_spells = 0 if number_of_spells < 0
    character.known_spells = Spells.all_spells.to_a.sample(number_of_spells).to_h
    character
  end
end
