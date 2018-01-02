require 'yaml'
require_relative './items.rb'

File.open('test_content.yml', "w") do |file|
  file.write(Items.full_item_list.to_yaml)
end

file = YAML.load_file('test_content.yml') #Load

puts file.inspect