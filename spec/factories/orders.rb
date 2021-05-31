FactoryBot.define do
  factory :order do
    sequence(:id) { |i| "Order ##{i}" }

     trait :successful do

     end

     trait :failing do

     end
  end
end
