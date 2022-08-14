# テーブル設計


## users テーブル

| Column             | Type   | Options                      |
| ------------------ | ------ | ---------------------------- |
| name               | string | null: false                  |
| kana               | string | null: false                  |
| nickname           | string | null: false                  |
| email              | string | null: false unique_key: true |
| birthday           | string | null: false                  | 
| encrypted_password | string | null: false                  |

### Association 

 * has_many :items
 * has_many :buys


## items テーブル

| Column            | Type    | Options                        |
| ----------------- | ------- | ------------------------------ |
| name              | string  | null: false                    |
| price             | integer | null: false                    |
| category          | string  | null: false                    |
| condition_id      | integer | null: false                    | 
| delivery_price_id | integer | null: false                    |
| delivery_day_id   | integer | null: false                    |
| prefectures       | string  | null: false                    |
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

  * has_one :buy
  * has_one :address


## addresses テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| buy           | references | null: false, foreign_key: true |
| post_code     | string     | null: false                    |
| prefectures   | string     | null: false                    |
| municipalities| string     | null: false                    |
| address       | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | string     | null: false                    |

### Association

  * has_one :buy
  * has_one :address
