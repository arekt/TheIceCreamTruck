class Order < EmbededType
  attribute :items, array: OrderItem, default: []
end
