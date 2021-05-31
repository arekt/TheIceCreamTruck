require_relative "config/environment"

truck = Truck.new(id: "track-0001")
truck.inventory << FoodItem.new(price: 100, name: "Ice Cream", flavor: "Chocolate")
truck.inventory << FoodItem.new(price: 100, name: "Ice Cream", flavor: "Chocolate")
truck.inventory << FoodItem.new(price: 200, name: "Ice Cream", flavor: "Pistacho")
truck.inventory << FoodItem.new(price: 200, name: "Ice Cream", flavor: "Pistacho")
truck.inventory << FoodItem.new(price: 100, name: "Ice Cream", flavor: "Strowberry")
truck.inventory << FoodItem.new(price: 100, name: "Ice Cream", flavor: "Strowberry")
truck.inventory << FoodItem.new(price: 130, name: "Shaved Ice")
truck.inventory << FoodItem.new(price: 130, name: "Shaved Ice")
truck.inventory << FoodItem.new(price: 130, name: "Shaved Ice")
truck.inventory << FoodItem.new(price: 230, name: "Snack Bar")
truck.inventory << FoodItem.new(price: 230, name: "Snack Bar")

order = Order.build(truck: truck, purchase_items: [
  FoodItem.new(name: "Ice Cream", flavor: "Chocolate")
])

puts order.to_json


order = Order.build(truck: truck, purchase_items: [
  FoodItem.new(price: 230, name: "Snack Bar"),
  FoodItem.new(price: 230, name: "Snack Bar"),
  FoodItem.new(price: 230, name: "Snack Bar")
])

puts order.to_json
