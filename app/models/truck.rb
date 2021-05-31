class Truck
  include ActiveModel::Model
  include ActiveModel::Attributes
  include ActiveModel::Serializers::JSON

  validates :id, presence: true

  attribute :inventory, array: FoodItem, default: []
  attribute :id, :string

  def save
    $redis.set "truck:#{id}", self.to_json
  end

  def self.find(id)
    truck_json = $redis.get("truck:#{id}")
    truck_attr = JSON.parse(truck_json)
    new(truck_attr)
  end
end
