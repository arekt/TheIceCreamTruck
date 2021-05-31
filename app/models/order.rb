require 'securerandom'

class Order < EmbededType
  attribute :items, array: OrderItem, default: []
  attribute :truck_id, :string
  attribute :id, :string
  attribute :status, :string # ["pending", "payment_completed", "payment_failed"]
  attribute :error, :string
  attribute :total_price, :integer

  def process_payment
    "TODO"
  end

  def self.build(truck:, purchase_items:)
    total_price = 0
    items = purchase_items.map do |purchase_item|
      item = truck.inventory.find do |inventory_item|
        inventory_item.name == purchase_item.name &&
          inventory_item.flavor == purchase_item.flavor
      end
      if item.present?
        truck.inventory.delete(item)
        total_price = total_price + item.price
      else
        break
      end
      OrderItem.new(name: item.name, price: item.price, quantity: 1) # TODO group items and increment quantity
    end

    if items&.count.to_i < purchase_items.count
      Order.new(items: items, error: "Inventory error")
    else
      Order.new(
        id: SecureRandom.uuid,
        items: items,
        truck_id: truck.id,
        status: "pending",
        total_price: total_price
      )
    end
  end

  def self.save
    puts "save order: TODO"
  end
end
