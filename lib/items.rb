require 'yaml'

# This class pulls all the items for the came from a yml file and provides it to the player in
# an easily obtainable way.
class Items
  def self.yml_file
    YAML.load_file(File.join(__dir__, 'config/items.yml'))
  end

  def self.default_weapon
    yml_file['fists']
  end

  def self.full_item_list
    yml_file
  end

  def self.weapons
    yml_file.to_a.find_all { |x| x[1][:type] == 'weapon' }.to_h
  end

  def self.armor_and_shields
    yml_file.to_a.find_all { |x| x[1][:type] == 'armor' || x[1][:type] == 'shield' }.to_h
  end

  def self.healing_items
    yml_file.to_a.find_all { |x| x[1][:type] == 'healing' }.to_h
  end

  def self.consumables
    yml_file.to_a.find_all { |x| x[1][:type] == 'healing' }.to_h
  end
end
