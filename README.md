# テーブル設計


## users テーブル

| Column             | Type   | Options                      |
| ------------------ | ------ | ---------------------------- |
| kanji_last_name    | string | null: false                  |
| kanji_first_name   | string | null: false                  |
| kana_last_name     | string | null: false                  |
| kana_first_name    | string | null: false                  |
| nickname           | string | null: false                  |
| email              | string | null: false, unique_key: true|
| birthday           | date   | null: false, unique: true    |
| encrypted_password | string | null: false                  |

### Association 

 * has_many :items
 * has_many :buys


## items テーブル

| Column            | Type    | Options                        |
| ----------------- | ------- | ------------------------------ |
| name              | string  | null: false                    |
| explanation       | text    | null: false                    |
| price             | integer | null: false                    |
| category_id       | integer | null: false                    |
| condition_id      | integer | null: false                    | 
| delivery_price_id | integer | null: false                    |
| delivery_day_id   | integer | null: false                    |
| prefectures_id    | integer | null: false                    |
| user             |references| null: false, foreign_key: true |

### Association

 * belongs_to :user
 * has_one :buy


## buys テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| item          | references | null: false, foreign_key: true |

### Association

 * has_one :address
 * belongs_to :user
 * belongs_to :item 

## addresses テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| buy           | references | null: false, foreign_key: true |
| post_code     | string     | null: false                    |
| prefectures_id| integer    | null: false                    |
| municipalities| string     | null: false                    |
| address       | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | string     | null: false                    |

### Association

  * belongs_to :buy
