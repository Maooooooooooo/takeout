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

### Association
- has_one :card
- has_many :restaurants
- has_many :purchases

### cards テーブル

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
| order_time_id   | integer       | null: false                    |
| image           | ActiveStorage | null: false                    |

### Association
- has_many :menus
- belongs_to :user

### menus テーブル

| Column          | Type          | Options                        |
| ----------------| ------------- | -------------------------------|
| food_name       | string        | null: false                    |
| explanation     | text          | null: false                    |
| price           | integer       | null: false                    |
| restaurant      | references    | null: false, foreign_key:true  |
| image           | ActiveStorage | null: false                    |

### Association
- belongs_to :restaurant
- has_many :purchases

### purchases テーブル

| Column          | Type          | Options                        |
| ----------------| ------------- | -------------------------------|
| user            | references    | null: false, foreign_key:true  |
| menu            | references    | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :menu
- has_many :pays

### pays テーブル

| Column          | Type          | Options                        |
| ----------------| ------------- | -------------------------------|
| purchase        | references    | null: false, foreign_key:true  |
| phone_number    | string        | null: false                    |

### Association
- belongs_to :purchase