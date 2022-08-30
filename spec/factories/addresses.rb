FactoryBot.define do
  factory :address do
    post_code {'000-0000'}
    prefecture_id {'2'}
    municipalities {'テスト'}
    house_number {'テスト1-1'}
    building_name {'テスト'}
    phone_number {'00011112222'}
    association :buy
  end
end
