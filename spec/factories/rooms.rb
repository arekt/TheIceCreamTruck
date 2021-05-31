FactoryBot.define do
  factory :rooms do
    name { |i| "room ##{i}" }
  end
end
