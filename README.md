# テーブル設計


## users テーブル

| Column             | Type   | Options                      |
| ------------------ | ------ | ---------------------------- |
| name               | string | null: false                  |
| nickname           | string | null: false                  |
| email              | string | null: false unique_key: true |
| birthday           | string | null: false                  | 
| encrypted_password | string | null: false                  |

### Association 

 * has_many :items
 * has_many :buys


## items テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| name           | string     | null: false                    |
| price          | string     | null: false                    |
| category       | string     | null: false                    |
| condition      | string     | null: false                    | 
| delivery_price | string     | null: false                    |
| delivery_day   | string     | null: false                    |
| image          | text       |                                |
| user           | references | null: false, foreign_key: true |

### Association

 * belongs_to :user
 * has_one :buy


## buys テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| item          | references | null: false, foreign_key: true |
| card_number   | string     | null: false                    |
| month         | string     | null: false                    |
| year          | string     | null: false                    |
| security_code | string     | null: false                    |

### Association

  * has_one :buy
  * has_one :address


## addresses テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| item          | references | null: false, foreign_key: true |
| post_code     | string     | null: false                    |
| prefectures   | string     | null: false                    |
| municipalities| text       | null: false                    |
| address       | text       | null: false                    |
| building_name | text       |                                |
| phone_number  | string     | null: false                    |

### Association

  * has_one :buy
  * has_one :address
