require 'yaml'
require_relative './spells.rb'
=begin
variable = {'spell_name' => {name: 'spell name', description: "You do a thing. \nThis is a new thing."}}

File.open('test_content.yml', "w") do |file|
  file.write(variable)
end
=end

variable = YAML.load_file('test_content.yml')

puts variable["burning hands"][:description]
