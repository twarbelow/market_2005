require 'minitest/autorun'
require 'minitest/pride'
require './lib/item'
require './lib/vendor'

class VendorTest < MiniTest::Test
  def setup
    @vendor = Vendor.new("Rocky Mountain Fresh")
  end

  def test_it_has_name
    assert_equal "Rocky Mountain Fresh", @vendor.name
  end

  def test_it_has_inventory
    assert_equal ({}), @vendor.inventory
  end
end
