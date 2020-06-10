class Market
  attr_reader :name, :vendors, :total_inventory

  def initialize(name)
    @name = name
    @vendors = []
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
    # hash of item object keys each with a value of a hash with quantity and vendors
    total_inventory = Hash.new(0)
    vendors.each do |vendor|
      vendor.inventory.each do |item, quantity|
        total_inventory[item] = {quantity: 0, vendors: []} if !total_inventory.has_key?(item)
        total_inventory[item][:quantity] += quantity
        total_inventory[item][:vendors] << vendor
      end
    end


    total_inventory
  end
end
