class Items

  def self.default_weapon
    return { name: "fists", type: "unarmed weapon", dice: 3, 
      number_of_dice: 1, number_of_attacks: 2, crit: 20, crit_damage: 3, enchantment: 0 }
  end

  def self.full_item_list
    return create_full_list_of_items
  end

  def self.weapons
    return create_list_of_weapons
  end

  def self.armor_and_shields
    return self.create_list_armor_and_shields
  end

  def self.consumables
    return self.create_list_consumables
  end

  def self.create_full_list_of_items
    full_item_list = {}
    full_item_list.merge!(create_list_of_weapons)
    full_item_list.merge!(create_list_armor_and_shields)
    full_item_list.merge!(create_list_consumables)

    return full_item_list
  end

  def self.create_list_of_weapons
    weapons = {
    "bronze sword" => { name: "bronze sword", type: "1-hand weapon", dice: 6, 
      number_of_dice: 1, number_of_attacks: 1, enchantment: 0, crit: 19, crit_damage: 2, price: 10 },
    "bronze greatsword" => { name: "bronze greatsword", type: "2-hand weapon", dice: 8, 
      number_of_dice: 1, number_of_attacks: 1, enchantment: 0, crit: 20, crit_damage: 3, price: 10 },
    "bronze knuckles" => { name: "bronze knuckles", type: "unarmed weapon", dice: 4, 
      number_of_dice: 1, number_of_attacks: 2, enchantment: 0, crit: 20, crit_damage: 3, price: 10 },
    "bronze dual swords" => { name: "bronze dual swords", type: "dual wield weapon", dice: 6, 
      number_of_dice: 1, number_of_attacks: 2, enchantment: 0, crit: 18, crit_damage: 2, price: 10 },
    "wooden staff" => { name: "wooden staff", type: "staff", dice: 4, 
      number_of_dice: 1, number_of_attacks: 1, enchantment: 0, crit: 20, crit_damage: 2, price: 10 }
    }

    return weapons
  end

  def self.create_list_armor_and_shields
    armor_and_shields = {
      "bronze shield" => { name: "bronze shield", type: "shield", defense_bonus: 1, enchantment: 0, price: 10 }
    }

    return armor_and_shields
  end

  def self.create_list_consumables
    consumables = {
      "small health potion" => { name: "small health potion", type: "healing", stat: "hp", bonus: 10, target: "any", price: 10},
      "large health potion" => { name: "large health potion", type: "healing", stat: "hp", bonus: 30, target: "any", price: 30},
      "small mana potion" => { name: "small mana potion", type: "healing", stat: "mana", bonus: 20, target: "any", price: 10},
      "large mana potion" => { name: "large mana potion", type: "healing", stat: "mana", bonus: 50, target: "any", price: 30}
    }

    return consumables
  end
end