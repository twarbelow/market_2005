require 'minitest/autorun'
require 'minitest/pride'
require './lib/item'

class ItemTest < MiniTest::Test
  def setup
    @item1 = Item.new({name: 'Peach', price: "$0.75"})
    @item2 = Item.new({name: 'Tomato', price: '$0.50'})
  end

  def test_it_has_name
    assert_equal "Tomato", @item2.name
  end

  def test_it_has_price
    assert_equal 0.50, @item2.price
  end
end
