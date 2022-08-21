FactoryBot.define do
  factory :item do
    name {'test'}
    explanation {'test'}
    price {'1000'}
    category_id {'2'}
    condition_id {'2'}
    send_price_id {'2'}
    send_day_id {'2'}
    prefecture_id {'2'}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
