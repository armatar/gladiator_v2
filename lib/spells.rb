require 'yaml'

# A class to hold all of the spells in the game. Should be able to call them
# by the type of spell they are as well as just in a general spell list.
class Spells
  def self.yml_file
    YAML.load_file(File.join(__dir__, 'config/spells.yml'))
  end

  def self.all_spells
    yml_file
  end

  def self.damage_spells
    yml_file.to_a.find_all { |x| x[1][:type] == 'damage' }.to_h
  end

  def self.healing_spells
    yml_file.to_a.find_all { |x| x[1][:type] == 'healing' }.to_h
  end

  def self.buff_spells
    yml_file.to_a.find_all { |x| x[1][:type] == 'buff' }.to_h
  end

  def self.create_curse_spells
    yml_file.to_a.find_all { |x| x[1][:type] == 'curse' }.to_h
  end

  def self.hybrid_spells
    yml_file.to_a.find_all { |x| x[1][:type] == 'hybrid' }.to_h
  end
end
