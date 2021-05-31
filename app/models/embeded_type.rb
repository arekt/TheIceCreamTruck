class EmbededType
  include ActiveModel::Model
  include ActiveModel::Attributes
  include ActiveModel::Serializers::JSON

  def self.assert_valid_value(value)
  end

  def self.cast(value)
    new(value)
  end
end
