class Item
  attr_reader :name, :price

  def initialize(info_hash)
    @name = info_hash[:name]
    @price = info_hash[:price].tr("$", "").to_f
  end
end
