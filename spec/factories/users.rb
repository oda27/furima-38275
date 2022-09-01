FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {Faker::Internet.free_email}
    password              {'aa0000'}
    password_confirmation {password}
    kanji_last_name       {'山田'}
    kanji_first_name      {'太郎'}
    kana_last_name        {'ヤマダ'}
    kana_first_name       {'タロウ'}
    birthday              {'1930-01-01'}
  end
end