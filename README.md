# README

### users テーブル

| Column             | Type      | Options                  |
| -------------------| ----------| -------------------------|
| nickname           | string    | null: false              |
| email              | string    | null: false,unique: true |
| encrypted_password | devise    | null: false              |
| first_name         | string    | null: false              |
| last_name          | string    | null: false              |
| first_name_kana    | string    | null: false              |
| last_name_kana     | string    | null: false              |
| select_corse_id    | integer   | null: false              |

### Association
- has_one :customer_token
- has_many :restaurants
- has_many :foods

### customer_token テーブル

| Column              | Type          | Options                        |
| ------------------- | ------------- | -------------------------------|
| user                | references    | null: false, foreign_key: true |
| customer_token      | string        | null: false                    |

### Association
- belongs_to :user

### restaurants テーブル

| Column          | Type          | Options                        |
| ----------------| ------------- | -------------------------------|
| user            | references    | null: false, foreign_key:true  |
| restaurant_name | string        | null: false                    |
| area_id         | integer       | null: false                    |
| address         | string        | null: false                    |
| genre_id        | integer       | null: false                    |
| opening_hours   | integer       | null: false                    |
| phone_number    | string        | null: false                    |

### Association
- has_many :foods
- belongs_to :user

### foods テーブル

| Column          | Type          | Options                        |
| ----------------| ------------- | -------------------------------|
| food_name       | string        | null: false                    |
| explanation     | text          | null: false                    |
| ticket_count    | integer       | null: false                    |
| price           | integer       | null: false                    |
| restaurant      | references    | null: false, foreign_key:true  |
| user            | references    | null: false, foreign_key:true  |

### Association
- belongs_to :restaurant
- belongs_to :user
- has_many :purchase

### purchases テーブル

| Column          | Type          | Options                        |
| ----------------| ------------- | -------------------------------|
| user            | references    | null: false, foreign_key:true  |
| food            | references    | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :food
- has_one :order

### orders テーブル

| Column          | Type          | Options                        |
| ----------------| ------------- | -------------------------------|
| purchase        | references    | null: false, foreign_key:true  |
| phone_number    | string        | null: false                    |
| order_time_id   | integer       | null: false                    |

### Association
- belongs_to :purchase