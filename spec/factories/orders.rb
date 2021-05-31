FactoryBot.define do
  factory :order do
    sequence(:id) { |i| "Order ##{i}" }
  end
end
