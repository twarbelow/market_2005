class Market
  attr_reader :name, :vendors, :all_inventory

  def initialize(name)
    @name = name
    @vendors = []
    @all_inventory = Hash.new(0)
  end

  def add_vendor(vendor)
    @vendors << vendor
  end

  def vendor_names
    vendors.map {|vendor| vendor.name}
  end

  def vendors_that_sell(item)
    vendors.find_all {|vendor| vendor.check_stock(item) > 0}
  end

  def total_inventory
    vendors.each do |vendor|
      vendor.inventory.each do |item, quantity|
        @all_inventory[item] = {quantity: 0, vendors: []} if !all_inventory.has_key?(item)
        @all_inventory[item][:quantity] += quantity
        @all_inventory[item][:vendors] << vendor
      end
    end
    all_inventory
  end

  def overstocked_items
    total_inventory
    all_inventory.find_all do |item|
      item[1][:quantity] > 50 && item[1][:vendors].count > 1
    end
  end
end
