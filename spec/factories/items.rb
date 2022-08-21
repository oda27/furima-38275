FactoryBot.define do
  factory :item do
    name {Faker::Lorem.sentence}
    explanation {Faker::Lorem.sentence}
    price {Faker::Lorem.sentence}
    category_id {Faker::Lorem.sentence}
    condition_id {Faker::Lorem.sentence}
    send_price_id {Faker::Lorem.sentence}
    send_day_id {Faker::Lorem.sentence}
    prefecture_id {Faker::Lorem.sentence}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
