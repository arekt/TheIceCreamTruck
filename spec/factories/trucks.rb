FactoryBot.define do
  factory :truck do
    sequence(:name) { |i| "Truck ##{i}" }
  end
end
