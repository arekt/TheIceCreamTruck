FactoryBot.define do
  factory :truck do
    sequence(:id) { |i| "Truck ##{i}" }
  end
end
