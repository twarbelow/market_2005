require 'minitest/autorun'
require 'minitest/pride'
require './lib/item'
require './lib/vendor'
require './lib/market'

class MarketTest < MiniTest::Test
  def setup
    @market = Market.new("South Pearl Street Farmers Market")
    @vendor1 = Vendor.new("Rocky Mountain Fresh")
    @vendor2 = Vendor.new("Ba-Nom-a-Nom")
    @vendor3 = Vendor.new("Palisade Peach Shack")
    @item1 = Item.new({name: 'Peach', price: "$0.75"})
    @item2 = Item.new({name: 'Tomato', price: '$0.50'})
    @item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
    @item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
    @vendor1.stock(@item1, 35)
    @vendor1.stock(@item2, 7)
    @vendor2.stock(@item4, 50)
    @vendor2.stock(@item3, 25)
    @vendor3.stock(@item1, 65)
  end

  def test_it_can_add_vendor
    assert_equal ([]), @market.vendors
    @market.add_vendor(@vendor1)
    @market.add_vendor(@vendor2)
    @market.add_vendor(@vendor3)
    assert_equal ([@vendor1, @vendor2, @vendor3]), @market.vendors
  end

  def test_it_has_vendor_names
    @market.add_vendor(@vendor1)
    @market.add_vendor(@vendor2)
    @market.add_vendor(@vendor3)
    assert_equal (["Rocky Mountain Fresh", "Ba-Nom-a-Nom", "Palisade Peach Shack"]),
    @market.vendor_names
  end

  def test_it_has_vendors_that_sell_item
    @market.add_vendor(@vendor1)
    @market.add_vendor(@vendor2)
    @market.add_vendor(@vendor3)
    assert_equal ([@vendor1, @vendor3]), @market.vendors_that_sell(@item1)
    assert_equal ([@vendor2]), @market.vendors_that_sell(@item4)
  end

  def test_it_has_total_inventory
    @vendor3.stock(@item3, 10)
    @market.add_vendor(@vendor1)
    @market.add_vendor(@vendor2)
    @market.add_vendor(@vendor3)
    assert_equal ({@item1 => {quantity: 100, vendors: [@vendor1, @vendor3]},
      @item2 => {quantity: 7, vendors: [@vendor1]},
      @item4 => {quantity: 50, vendors: [@vendor2]},
      @item3 => {quantity: 35, vendors: [@vendor2, @vendor3]}}),
      @market.total_inventory
  end
end
