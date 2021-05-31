class Truck
  include ActiveModel::Model
  include ActiveModel::Attributes
  include ActiveModel::Serializers::JSON

  validates :name, presence: true

  attribute :inventory, array: FoodItem, default: []
  attribute :name, :string

  def save
    $redis.set "truck:#{name}", self.to_json
  end

  def self.find(name)
    truck_json = $redis.get("truck:#{name}")
    truck_attr = JSON.parse(truck_json)
    new(truck_attr)
  end
end
