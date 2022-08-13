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

## items テーブル

| Column         | Type       | Options                      |
| -------------- | ---------- | ---------------------------- |
| name           | string     | null: false                  |
| price          | string     | null: false                  |
| category       | string     | null: false                  |
| condition      | string     | null: false                  | 
| delivery_price | string     | null: false                  |
| delivery_day   | string     |                               |
| address        | references | null: false, foreign_key: true |
| user           | references | null: false, foreign_key: true |

### Association

 * belongs_to :user
 * has_one :buy

## buys テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| item          | references | null: false, foreign_key: true |
| date          | string     | null: false                    |

### Association

  * has_one :buy
  * has_one :address


## addresss テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| item          | references | null: false, foreign_key: true |
| date          | string     | null: false                    |

### Association

  * has_one :buy
  * has_one :address