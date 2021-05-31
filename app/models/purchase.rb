class Purchase
  include ActiveModel::Model
  include ActiveModel::Attributes
  include ActiveModel::Serializers::JSON

  validates :name, presence: true

  attribute :order, Order
  attribute :id, :string

  def save
    $redis.set "purchase:#{id}", self.to_json
  end

  def self.find(name)
    purchase_json = $redis.get("purchase:#{name}")
    purchase_attr = JSON.parse(purchase_json)
    new(purchase_attr)
  end
end
