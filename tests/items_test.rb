require_relative 'test_helper.rb'
require_relative '../lib/items.rb'

# This test just ensures that the class Items
# has non-empty variables to use.
class ItemsTest < MiniTest::Test
  should_not_be_nil = { 'full item list' => Items.full_item_list,
                        'weapons' => Items.weapons,
                        'armor_ and shields' => Items.armor_and_shields,
                        'consumables' => Items.consumables }

  should_not_be_nil.each_pair do |key, value|
    define_method("test_#{key}_should_not_be_nil") do
      refute_nil(value)
    end
  end
end
